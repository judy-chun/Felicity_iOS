//
//  ViewController.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/19/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let nav = self.navigationBar
    
        // 2
   //     nav.barStyle = UIBarStyle.black
   //     nav.tintColor = UIColor.yellow
    
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
