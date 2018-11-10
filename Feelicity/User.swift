//
//  User.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import Firebase

class User: NSObject {
    
    
    static var current:User?
    
    var userid:String?
    
    static func setCurrentUser() {
        let user = User()
        user.userid = Auth.auth().currentUser?.uid
        User.current = user
    }

}
