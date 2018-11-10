//
//  LogASessionViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 7/18/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class LogASessionViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        if (Auth.auth().currentUser?.uid == nil) {
            self.goToSignInVC()
        }
        Journal.current?.currentPage = 1
        guard let currentJournal = UserDefaults.standard.object(forKey: "currentJournal") as? Journal else {
            Journal.current = Journal()
            return }   // retrieves current journal object or if object is empty then create new journal object
        Journal.current = currentJournal
        switch (currentJournal.currentPage) {
        case 1 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let CBTDefVC = storyboard.instantiateViewController(withIdentifier: "CBTDef") as! CBTDefViewController
            self.navigationController?.pushViewController(CBTDefVC, animated: true)
            break
            
        case 2 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let CBTDiagramVC = storyboard.instantiateViewController(withIdentifier: "CBTDiagram") as! CBTDiagramViewController
            self.navigationController?.pushViewController(CBTDiagramVC, animated: true)
            break
            
        case 3 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let PreMoodVC = storyboard.instantiateViewController(withIdentifier: "PreMood") as! PreMoodViewController
            self.navigationController?.pushViewController(PreMoodVC, animated: true)
            break
            
        case 4 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q1VC = storyboard.instantiateViewController(withIdentifier: "Q1") as! Q1ViewController
            self.navigationController?.pushViewController(Q1VC, animated: true)
            break
            
        case 5 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q2VC = storyboard.instantiateViewController(withIdentifier: "Q2") as! Q2ViewController
            self.navigationController?.pushViewController(Q2VC, animated: true)
            break
            
        case 6 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q3VC = storyboard.instantiateViewController(withIdentifier: "Q3") as! Q3ViewController
            self.navigationController?.pushViewController(Q3VC, animated: true)
            break
            
        case 7 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q4VC = storyboard.instantiateViewController(withIdentifier: "Q4") as! Q4ViewController
            self.navigationController?.pushViewController(Q4VC, animated: true)
            break
            
        case 8 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q5VC = storyboard.instantiateViewController(withIdentifier: "Q5") as! Q5ViewController
            self.navigationController?.pushViewController(Q5VC, animated: true)
            break
            
        case 9 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q6VC = storyboard.instantiateViewController(withIdentifier: "Q6") as! Q6ViewController
            self.navigationController?.pushViewController(Q6VC, animated: true)
            break
            
        case 10 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q7VC = storyboard.instantiateViewController(withIdentifier: "Q7") as! Q7ViewController
            self.navigationController?.pushViewController(Q7VC, animated: true)
            break
            
        case 11 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q8VC = storyboard.instantiateViewController(withIdentifier: "Q8") as! Q8ViewController
            self.navigationController?.pushViewController(Q8VC, animated: true)
            break
            
        case 12 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q9VC = storyboard.instantiateViewController(withIdentifier: "Q9") as! Q9ViewController
            self.navigationController?.pushViewController(Q9VC, animated: true)
            break
            
        case 13 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q10VC = storyboard.instantiateViewController(withIdentifier: "Q10") as! Q10ViewController
            self.navigationController?.pushViewController(Q10VC, animated: true)
            break
            
        case 14 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q11VC = storyboard.instantiateViewController(withIdentifier: "Q11") as! Q11ViewController
            self.navigationController?.pushViewController(Q11VC, animated: true)
            break
            
        case 15 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q12VC = storyboard.instantiateViewController(withIdentifier: "Q12") as! Q12ViewController
            self.navigationController?.pushViewController(Q12VC, animated: true)
            break
            
        case 16 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q13VC = storyboard.instantiateViewController(withIdentifier: "Q13") as! Q13ViewController
            self.navigationController?.pushViewController(Q13VC, animated: true)
            break
            
        case 17 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q14VC = storyboard.instantiateViewController(withIdentifier: "Q14") as! Q14ViewController
            self.navigationController?.pushViewController(Q14VC, animated: true)
            break
            
        case 18 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q15VC = storyboard.instantiateViewController(withIdentifier: "Q15") as! Q15ViewController
            self.navigationController?.pushViewController(Q15VC, animated: true)
            break
            
        case 19 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q16VC = storyboard.instantiateViewController(withIdentifier: "Q16") as! Q16ViewController
            self.navigationController?.pushViewController(Q16VC, animated: true)
            break
            
        case 20 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q17VC = storyboard.instantiateViewController(withIdentifier: "Q17") as! Q17ViewController
            self.navigationController?.pushViewController(Q17VC, animated: true)
            break
            
        case 21 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q18VC = storyboard.instantiateViewController(withIdentifier: "Q18") as! Q18ViewController
            self.navigationController?.pushViewController(Q18VC, animated: true)
            break
            
        case 22 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let Q19VC = storyboard.instantiateViewController(withIdentifier: "Q19") as! Q19ViewController
            self.navigationController?.pushViewController(Q19VC, animated: true)
            break
            
        case 23 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let PostMoodVC = storyboard.instantiateViewController(withIdentifier: "PostMood") as! PostMoodViewController
            self.navigationController?.pushViewController(PostMoodVC, animated: true)
            break
            
        case 24 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let EndVC = storyboard.instantiateViewController(withIdentifier: "End") as! EndViewController
            self.navigationController?.pushViewController(EndVC, animated: true)
            break
            
        default :
            break
        }
    }
    
    @IBAction func logASession(_ sender: Any) {
        Analytics.logEvent("land_on_CBT_Def", parameters: ["land_on_CBT_Def": true])
    }
    
    
    @IBAction func goToSignInVC() {
        GIDSignIn.sharedInstance().signOut()
        FBSDKLoginManager().logOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            User.current = nil
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToCBTDef() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CBTDefVC = storyboard.instantiateViewController(withIdentifier: "CBTDef") as! CBTDefViewController
        self.navigationController?.pushViewController(CBTDefVC, animated: true)
    }

}
