//
//  ReferencesPopup.swift
//  Felicity
//
//  Created by Sonal Prasad on 8/28/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class ReferencesPopup: UIViewController {
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
}
