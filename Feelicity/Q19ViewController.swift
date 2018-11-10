//
//  Q19ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Q19ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var emotions = [Emotions]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    @objc func handleSlider(_ sender: UISlider) {
        emotions[sender.tag].value = Int(sender.value * 100)
        switch(emotions[sender.tag].name) {
        case "Anger" :
            Journal.current?.angerPercentageReview1 = emotions[sender.tag].value
            break
            
        case "Hopelessness" :
            Journal.current?.hopelessnessPercentageReview2 = emotions[sender.tag].value
            break
            
        case "Emptiness" :
            Journal.current?.emptinessPercentageReview3 = emotions[sender.tag].value
            break
        
        case "Worthlessness" :
            Journal.current?.worthlessnessPercentageReview4 = emotions[sender.tag].value
            break
            
        case "Guilt" :
            Journal.current?.guiltPercentageReview5 = emotions[sender.tag].value
            break
            
        case "Frustration" :
            Journal.current?.frustrationPercentageReview6 = emotions[sender.tag].value
            break
            
        case "Shame" :
            Journal.current?.shamePercentageReview7 = emotions[sender.tag].value
            break
            
        case "Irritation" :
            Journal.current?.irritationPercentageReview8 = emotions[sender.tag].value
            break
            
        case "Lethargic" :
            Journal.current?.lethargicPercentageReview9 = emotions[sender.tag].value
            break
            
        case "Vulnerable" :
            Journal.current?.vulnerablePercentageReview10 = emotions[sender.tag].value
            break
            
        case "Sensitive" :
            Journal.current?.sensitivePercentageReview11 = emotions[sender.tag].value
            break
            
        default :
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "emotionsCell", for: indexPath) as? emotionsCell {
            cell.emotionLabel.text = emotions[indexPath.row].name       // emotion at the row you're on
            cell.stronglyDisagree.text = "Strongly Disagree"
            cell.stronglyAgree.text = "Strongly Agree"
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
        Journal.current?.currentPage = 23
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
        
        
        
        if currentJournal.feelsAngerPost {
            // insert new slider
            let emotion = Emotions()
            emotion.name = "Anger"
            emotions.append(emotion)
            
        }
        
        if currentJournal.feelsHopelessnessPost {
            let emotion = Emotions()
            emotion.name = "Hopelessness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsEmptinessPost {
            let emotion = Emotions()
            emotion.name = "Emptiness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsWorthlessnessPost {
            let emotion = Emotions()
            emotion.name = "Worthlessness"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsGuiltPost {
            let emotion = Emotions()
            emotion.name = "Guilt"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsFrustrationPost {
            let emotion = Emotions()
            emotion.name = "Frustration"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsShamePost {
            let emotion = Emotions()
            emotion.name = "Shame"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsIrritationPost {
            let emotion = Emotions()
            emotion.name = "Irritation"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsLethargicPost {
            let emotion = Emotions()
            emotion.name = "Lethargic"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsVulnerablePost {
            let emotion = Emotions()
            emotion.name = "Vulnerable"
            emotions.append(emotion)
        }
        
        if currentJournal.feelsSensitivePost {
            let emotion = Emotions()
            emotion.name = "Sensitive"
            emotions.append(emotion)
        }
        
    }
    
    
    @IBAction func Q19(_ sender: Any) {
        Analytics.logEvent("land_on_Q20", parameters: ["land_on_Q20": true])
    }
    
    
}
