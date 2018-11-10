//
//  SignUp.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/2/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    //var ref = Database.database().reference()
    
    var ref : DatabaseReference!
    
    @IBAction func signUp(_ sender: Any) {
        if let email = emailLogin.text, let password = passwordLogin.text {        // makes sure email isn't empty
            if email != "" && password != "" {
                signUpEmail(email: email, password: password)
            }
            else {
                showAlert()
            }
        }
    }
    
    func signUpEmail(email: String,password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            if let error = error {
                //
                print(error.localizedDescription)
                self.showAlert()
                return
            }
            self.ref.child("Users").child(Auth.auth().currentUser!.uid).setValue(["email": email])   // random ID
            
            let user = User()
            
            
            user.userid = Auth.auth().currentUser?.uid
            
            User.current = user
            // User is signed in
            //
            self.goToMainVC()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Done button for dismissing keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (doneClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        emailLogin.inputAccessoryView = toolbar
        passwordLogin.inputAccessoryView = toolbar
        
        ref =  Database.database().reference()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "GreenBackground"))!)
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    @objc func goToMainVC() {
        
        //Put segue code here, In here go to next VC by calling your segue or doing it programattically
        User.setCurrentUser()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LogASessionVC = storyboard.instantiateViewController(withIdentifier: "LogASessionViewController") as! LogASessionViewController
        self.dismiss(animated: true, completion: nil)
        //self.navigationController?.pushViewController(LogASessionVC, animated: true)
    }
    
    @objc func showAlert() {
        
        //Put alert code here
        let alert = UIAlertController(title: "Alert", message: "Try Again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
