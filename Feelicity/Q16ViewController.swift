//
//  Q16ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class Q16ViewController: UIViewController {
    
    
    @IBOutlet weak var beliefSlider: UISlider!
    @IBOutlet weak var thought: UILabel!
    
    
    override func viewDidLoad() {
        Journal.current?.currentPage = 20
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
   //     var thought = UILabel(frame: CGRect(x: 12, y: 30, width: 350, height: 75))
  //      thought.textAlignment = NSTextAlignment.center
        thought.text = Journal.current?.thoughtDescription1
   //     self.view.addSubview(thought)
    }
    
    @IBAction func submit(_ sender: Any) {
        
        Journal.current?.believePreviousThought = Int(beliefSlider.value * 100)
        Analytics.logEvent("land_on_Q17", parameters: ["land_on_Q17": true])
    }
    
}
