//
//  Q4ViewController.swift
//  Feelicity
//
//  Created by Sharan Singh on 8/17/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class  Q4ViewController: UIViewController {
    
    //Outlet for Question 1
    @IBOutlet weak var AngerButton: UIButton!
    @IBOutlet weak var EmptinessButton: UIButton!
    @IBOutlet weak var GuiltButton: UIButton!
    @IBOutlet weak var ShameButton: UIButton!
    @IBOutlet weak var LethargicButton: UIButton!
    @IBOutlet weak var HopelessnessButton: UIButton!
    @IBOutlet weak var WorthlessnessButton: UIButton!
    @IBOutlet weak var FrustrationButton: UIButton!
    @IBOutlet weak var IrritationButton: UIButton!
    @IBOutlet weak var VulnerableButton: UIButton!
    @IBOutlet weak var SensitiveButton: UIButton!
    
    
    @IBAction func feelsangerClicked(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsAnger = !currentJournal.feelsAnger
        AngerButton.backgroundColor = currentJournal.feelsAnger ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelshopelessnessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsHopelessness = !currentJournal.feelsHopelessness
        HopelessnessButton.backgroundColor = currentJournal.feelsHopelessness ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsemptinessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsEmptiness = !currentJournal.feelsEmptiness
        EmptinessButton.backgroundColor = currentJournal.feelsEmptiness ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsworthlessnessClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsWorthlessness = !currentJournal.feelsWorthlessness
        WorthlessnessButton.backgroundColor = currentJournal.feelsWorthlessness ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsguiltClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsGuilt = !currentJournal.feelsGuilt
        GuiltButton.backgroundColor = currentJournal.feelsGuilt ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsfrustrationClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsFrustration = !currentJournal.feelsFrustration
        FrustrationButton.backgroundColor = currentJournal.feelsFrustration ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsshameClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsShame = !currentJournal.feelsShame
        ShameButton.backgroundColor = currentJournal.feelsShame ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsirritationClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsIrritation = !currentJournal.feelsIrritation
        IrritationButton.backgroundColor = currentJournal.feelsIrritation ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelslethargicClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsLethargic = !currentJournal.feelsLethargic
        LethargicButton.backgroundColor = currentJournal.feelsLethargic ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelsvulnerableClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsVulnerable = !currentJournal.feelsVulnerable
        VulnerableButton.backgroundColor = currentJournal.feelsVulnerable ? UIColor.gray : UIColor.lightGray
    }
    
    @IBAction func feelssensitiveClicked(_ sender: Any) {
        guard let currentJournal = Journal.current else {return} // safely unwrap journal
        currentJournal.feelsSensitive = !currentJournal.feelsSensitive
        SensitiveButton.backgroundColor = currentJournal.feelsSensitive ? UIColor.gray : UIColor.lightGray
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Journal.current?.currentPage = 8
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
    @IBAction func Q4(_ sender: Any) {
        Analytics.logEvent("land_on_Q5", parameters: ["land_on_Q5": true])
    }
    
    
}

