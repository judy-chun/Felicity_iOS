//
//  Q5ViewController.swift
//  Feelicity
//
//  Created by Sharan Singh on 8/17/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class  Q5ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var emotions = [Emotions]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    @objc func handleSlider(_ sender: UISlider) {
        emotions[sender.tag].value = Int(sender.value * 100)
        switch(emotions[sender.tag].name) {
        case "Anger" :
            Journal.current?.angerPercentage1 = emotions[sender.tag].value
            break
            
        case "Hopelessness" :
            Journal.current?.hopelessnessPercentage2 = emotions[sender.tag].value
            break
            
        case "Emptiness" :
            Journal.current?.emptinessPercentage3 = emotions[sender.tag].value
            break
            
        case "Worthlessness" :
            Journal.current?.worthlessnessPercentage4 = emotions[sender.tag].value
            break
            
        case "Guilt" :
            Journal.current?.guiltPercentage5 = emotions[sender.tag].value
            break
            
        case "Frustration" :
            Journal.current?.frustrationPercentage6 = emotions[sender.tag].value
            break
            
        case "Shame" :
            Journal.current?.shamePercentage7 = emotions[sender.tag].value
            break
            
        case "Irritation" :
            Journal.current?.irritationPercentage8 = emotions[sender.tag].value
            break
            
        case "Lethargic" :
            Journal.current?.lethargicPercentage9 = emotions[sender.tag].value
            break
            
        case "Vulnerable" :
            Journal.current?.vulnerablePercentage10 = emotions[sender.tag].value
            break
            
        case "Sensitive" :
            Journal.current?.sensitivePercentage11 = emotions[sender.tag].value
            break
            
        default :
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "emotionsCell", for: indexPath) as? emotionsCell {
            cell.stronglyDisagree.text = "Strongly Disagree"
            cell.stronglyAgree.text = "Strongly Agree"
            cell.emotionLabel.text = emotions[indexPath.row].name       // emotion at the row you're on
            cell.emotionSlider.value = Float(emotions[indexPath.row].value)/100.0
            cell.emotionSlider.addTarget(self, action: #selector(handleSlider(_:)), for: .valueChanged)
            cell.emotionSlider.tag = indexPath.row
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotions.count
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Journal.current?.currentPage = 9
        
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100.0
        guard let currentJournal = Journal.current else {return}
        
        
        
        if currentJournal.feelsAnger {
            // insert new slider
            let emotion = Emotions()
            emotion.name = "Anger"
            emotions.append(emotion)
            
        }
        
        if currentJournal.feelsHopelessness {
            let emotion = Emotions()
            emotion.name = "Hopelessness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsEmptiness {
            let emotion = Emotions()
            emotion.name = "Emptiness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsWorthlessness {
            let emotion = Emotions()
            emotion.name = "Worthlessness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsGuilt {
            let emotion = Emotions()
            emotion.name = "Guilt"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsFrustration {
            let emotion = Emotions()
            emotion.name = "Frustration"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsShame {
            let emotion = Emotions()
            emotion.name = "Shame"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsIrritation {
            let emotion = Emotions()
            emotion.name = "Irritation"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsLethargic {
            let emotion = Emotions()
            emotion.name = "Lethargic"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsVulnerable {
            let emotion = Emotions()
            emotion.name = "Vulnerable"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsSensitive {
            let emotion = Emotions()
            emotion.name = "Sensitive"
            emotions.append(emotion)
        }

    }
    
    @IBAction func Q5(_ sender: Any) {
        Analytics.logEvent("land_on_Q6", parameters: ["land_on_Q6": true])
    }
    
    
}
