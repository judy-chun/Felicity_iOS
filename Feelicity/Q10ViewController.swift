//
//  Q10ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class Q10ViewController: UIViewController {
    
    @IBOutlet weak var thoughtText: UITextField!
    @IBOutlet weak var effectText: UITextView!
    
    override func viewDidLoad() {
        Journal.current?.currentPage = 14
        //Done button for dismissing keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (doneClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        thoughtText.inputAccessoryView = toolbar
        effectText.inputAccessoryView = toolbar
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func addAnotherScenario(_ sender: Any) {
        if let thoughtText = thoughtText.text, let effectText = effectText.text {
            // text is not empty
            if ((thoughtText != "") && (effectText != "")) {
                let thought = Thought()
                thought.thought = thoughtText
                thought.effect = effectText
                Journal.current?.thoughts.append(thought)
                self.thoughtText.text = ""
                self.effectText.text = ""
            }
            else {
                //alert please enter text
            }
        }
    }
    
    @IBAction func Q10(_ sender: Any) {
        Analytics.logEvent("land_on_Q11", parameters: ["land_on_Q11": true])
    }
    
    

    
}
