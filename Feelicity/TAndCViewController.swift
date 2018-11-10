//
//  TAndCViewController.swift
//  Felicity
//
//  Created by Sonal Prasad on 8/24/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class  TAndCViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var accept: UIButton!
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Journal.current?.currentPage = 5
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "SunIcon")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
     
        accept.isEnabled = false
        
    }
    
    @IBAction func dontAcceptAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Terms and Conditions", message: "Please accept the terms and conditions to use the app", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        accept.isEnabled = scrollView.contentOffset.y + scrollView.bounds.height == scrollView.contentSize.height
    }


}
