//
//  Q20ViewController.swift
//  Felicity
//
//  Created by Sonal Prasad on 8/23/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class  Q20ViewController: UIViewController {
    
    @IBOutlet weak var Q1TextBox: UITextView!
    @IBOutlet weak var Q2TextBox: UITextView!
    @IBOutlet weak var Q3TextBox: UITextView!
    
    @IBAction func Submit(_ sender: Any) {
        Journal.current?.doneDifferently = Q1TextBox.text
        Journal.current?.whatHelped = Q2TextBox.text
        Journal.current?.whatDidnt = Q3TextBox.text
        Analytics.logEvent("land_on_post_mood", parameters: ["land_on_post_mood": true])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Journal.current?.currentPage = 5
        //Done button for dismissing keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (doneClicked))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        Q1TextBox.inputAccessoryView = toolbar
        Q2TextBox.inputAccessoryView = toolbar
        Q3TextBox.inputAccessoryView = toolbar
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
    
}
