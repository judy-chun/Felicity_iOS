//
//  Q14ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class Q14ViewController: UIViewController {
    
    
    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var Fact: UISwitch!
    
    @IBOutlet weak var Opinion: UISwitch!
    
    override func viewDidLoad() {
        Journal.current?.currentPage = 18
        //Done button for dismissing keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (doneClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        text.inputAccessoryView = toolbar
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
    
    @IBAction func submit(_ sender: Any) {
    Journal.current?.mostImpactfulThought = text.text
        
        if Fact.isOn {
            Journal.current?.fact = true
        }
        else {
            Journal.current?.fact = false
        }
        
        if Opinion.isOn {
            Journal.current?.opinion = true
        }
        else {
            Journal.current?.opinion = false
        }
        Analytics.logEvent("land_on_Q15", parameters: ["land_on_Q15": true])
    }
    
}
