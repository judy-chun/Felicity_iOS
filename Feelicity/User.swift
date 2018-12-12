//
//  User.swift
//  Feelicity
//
//  Created by Sonal Prasad on 8/15/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class User: NSObject {
    
    
    static var current:User?
    
    var userid:String?
    
    public private(set) var publicKey: SecKey?
    public private(set) var privateKey: SecKey?
    public private(set) var pubKeyString: String = ""
    
    static func setCurrentUser() {
        let user = User()
        user.userid = Auth.auth().currentUser?.uid
        User.current = user
    }
    
    func loadCurrentUser() {
        User.current?.loadCurrentUser()
    }
    
    func setKeys(privateKey: SecKey, publicKey: SecKey) {
        var error: Unmanaged<CFError>?
        self.publicKey = publicKey
        self.privateKey = privateKey
        
        if let cfdata = SecKeyCopyExternalRepresentation(publicKey, &error) {
            let data: Data = cfdata as Data
            self.pubKeyString = data.base64EncodedString()
            //Crypto.current?.savePK()
        } else {
            print("Error: \(error)")
        }
    }
    
}

