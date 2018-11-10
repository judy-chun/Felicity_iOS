//
//  ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 4/19/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class SignInViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Done button for dismissing keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (doneClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        emailTextField.inputAccessoryView = toolbar
        passwordTextField.inputAccessoryView = toolbar
        
        ref = Database.database().reference()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        facebookLogin.delegate = self
        facebookLogin.readPermissions = [ "public_profile","email" ]
        
        if let accessToken = FBSDKAccessToken.current() {
            // User is logged in, use 'accessToken' here.
            goToMainVC()
        }
        //loginButton = LoginButton(readPermissions: [ .publicProfile, .Email, .UserFriends ])
        
        //GIDSignIn.sharedInstance().signIn()
        // TODO(developer) Configure the sign-in button look/feel
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "GreenBackground"))!)
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            //
            self.showAlert()
            return
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                //
                self.showAlert()
                return
            }
            // User is signed in
            
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id,name,email,first_name,last_name"]).start { (connection, result, err) in
                
                if err != nil {
                    print("Failed to start graph request:", err ?? "")
                    return
                }
                
                // result from FB
                var email = ""
                if let data = result as? [String:Any] {
                    if let unwrappedEmail = data["email"] as? String {
                        email = unwrappedEmail
                    }
                }
                self.ref?.child("Users").child(Auth.auth().currentUser!.uid).setValue(["email": email])
                print(result ?? "")
            }
            
            self.goToMainVC()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    

    @IBOutlet weak var facebookLogin: FBSDKLoginButton!
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    
  /*  @IBAction func signUp(_ sender: Any) {
        if let email = emailLogin.text, let password = passwordLogin.text {        // makes sure email isn't empty
            if email != "" && password != "" {
                signUpEmail(email: email, password: password)
            }
            else {
                showAlert()
            }
        }
    }
    */
    
    @IBAction func emailLogin(_ sender: Any) {
        if let email = emailLogin.text, let password = passwordLogin.text {        // makes sure email isn't empty
            if email != "" && password != "" {
                signInEmail(email: email, password: password)
            }
            else {
                showAlert()
            }
        }
    }
    /*
    func signUpEmail(email: String,password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
    // ...
            self.goToMainVC()
        }
    }
    */
    func signInEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            // ...
            if let error = error {
                //
                self.showAlert()
                return
            }
            // User is signed in
       //self.ref.child("Users").child(Auth.auth().currentUser!.uid).setValue(["email": email])
            self.goToMainVC()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(goToMainVC), name: NSNotification.Name(rawValue: "googleSignInSucceeded"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAlert), name: NSNotification.Name(rawValue: "googleSignInFailed"), object: nil)
        if Auth.auth().currentUser != nil {
           goToMainVC()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func goToMainVC() {
        
        User.setCurrentUser()
        //Put segue code here, In here go to next VC by calling your segue or doing it programattically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let TAndCVC = storyboard.instantiateViewController(withIdentifier: "TAndCViewController") 
        self.navigationController?.pushViewController(TAndCVC, animated: true)
    }
    
    @objc func showAlert() {
        
        //Put alert code here
        let alert = UIAlertController(title: "Oops!", message: "Try Again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

