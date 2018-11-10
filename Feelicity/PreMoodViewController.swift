//
//  PreMoodViewController.swift
//  Feelicity
//
//  Created by Sharan Singh on 8/17/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class PreMoodViewController: UIViewController {
    
    //Question 1 Outlet
    @IBOutlet weak var PreMoodSlider: UISlider!
    
    //Question 2 Outlets
    @IBOutlet weak var LovedButton: UIButton!
    @IBOutlet weak var HappyButton: UIButton!
    @IBOutlet weak var NervousButton: UIButton!
    @IBOutlet weak var AngryButton: UIButton!
    @IBOutlet weak var TiredButton: UIButton!
    @IBOutlet weak var SadButton: UIButton!
    @IBOutlet weak var OkayButton: UIButton!
    
    @IBAction func lovedbutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preLoved = !currentJournal.preLoved;
        LovedButton.alpha = currentJournal.preLoved ?
            1.0 : 0.5
    }
    
    @IBAction func happybutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preHappy = !currentJournal.preHappy;
        HappyButton.alpha = currentJournal.preHappy ?
            1.0 : 0.5
    }
    
    @IBAction func nervousbutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preNervous = !currentJournal.preNervous;
        NervousButton.alpha = currentJournal.preNervous ?
            1.0 : 0.5
    }
    
    @IBAction func angrybutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preAngry = !currentJournal.preAngry;
        AngryButton.alpha = currentJournal.preAngry ?
            1.0 : 0.5
    }
    
    @IBAction func tiredbutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preTired = !currentJournal.preTired;
        TiredButton.alpha = currentJournal.preTired ?
            1.0 : 0.5
    }
    
    @IBAction func sadbutton(_ sender: UIButton) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preSad = !currentJournal.preSad;
        SadButton.alpha = currentJournal.preSad ?
            1.0 : 0.5
    }
    
    @IBAction func okaybutton(_ sender: Any) {
        guard let currentJournal = Journal.current else {return}
        currentJournal.preOkay = !currentJournal.preOkay;
        OkayButton.alpha = currentJournal.preOkay ?
            1.0 : 0.5
    }
    
    @IBAction func Submit(_ sender: Any) {
       // guard let currentJournal = Journal.current else {return}
        Journal.current?.situationDescription1 = Int(PreMoodSlider.value * 100)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Journal.current?.currentPage = 4
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
    
}
