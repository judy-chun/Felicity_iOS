//
//  Q18ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class Q18ViewController: UIViewController {
    
    @IBOutlet weak var angry: UIButton!
    @IBOutlet weak var hopelessness: UIButton!
    @IBOutlet weak var emptiness: UIButton!
    @IBOutlet weak var worthlessness: UIButton!
    @IBOutlet weak var guilt: UIButton!
    @IBOutlet weak var frustration: UIButton!
    @IBOutlet weak var shame: UIButton!
    @IBOutlet weak var irritation: UIButton!
    @IBOutlet weak var lethargic: UIButton!
    @IBOutlet weak var vulnerable: UIButton!
    @IBOutlet weak var sensitive: UIButton!
    
    
    override func viewDidLoad() {
        Journal.current?.currentPage = 22
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
    @IBAction func angerClicked(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsAngerPost = !currentJournal.feelsAngerPost
        angry.backgroundColor = currentJournal.feelsAngerPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func hopelessnessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsHopelessnessPost = !currentJournal.feelsHopelessnessPost
        hopelessness.backgroundColor = currentJournal.feelsHopelessnessPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func emptinessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsEmptinessPost = !currentJournal.feelsEmptinessPost
        emptiness.backgroundColor = currentJournal.feelsEmptinessPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func worthlessnessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsWorthlessnessPost = !currentJournal.feelsWorthlessnessPost
        worthlessness.backgroundColor = currentJournal.feelsWorthlessnessPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func guiltClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsGuiltPost = !currentJournal.feelsGuiltPost
        guilt.backgroundColor = currentJournal.feelsGuiltPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func frustrationClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsFrustrationPost = !currentJournal.feelsFrustrationPost
        frustration.backgroundColor = currentJournal.feelsFrustrationPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func shameClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsShamePost = !currentJournal.feelsShamePost
        shame.backgroundColor = currentJournal.feelsShamePost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func irritationClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsIrritationPost = !currentJournal.feelsIrritationPost
        irritation.backgroundColor = currentJournal.feelsIrritationPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func lethargicClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsLethargicPost = !currentJournal.feelsLethargicPost
        lethargic.backgroundColor = currentJournal.feelsLethargicPost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func vulnerableClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsVulnerablePost = !currentJournal.feelsVulnerablePost
        vulnerable.backgroundColor = currentJournal.feelsVulnerablePost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func sensitiveClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsSensitivePost = !currentJournal.feelsSensitivePost
        sensitive.backgroundColor = currentJournal.feelsSensitivePost ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func Q18(_ sender: Any) {
        Analytics.logEvent("land_on_Q19", parameters: ["land_on_Q19": true])
    }
    
    
}
