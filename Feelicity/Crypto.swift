//
//  Crypto.swift
//  Feelicity
//
//  Created by Sonal Prasad on 12/12/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import AlamofireNetworkActivityIndicator

class Crypto: NSObject {
    
    static var current:Crypto?
    var ref: DatabaseReference!
    
    func loadCurrentUser() {
        
        //NetworkActivityIndicatorManager.shared.networkOperationStarted(closure: moveToMainWindow)
        NetworkActivityIndicatorManager.shared.networkOperationStarted()
        ref.child("users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            NetworkActivityIndicatorManager.shared.networkOperationFinished()
            guard let value = snapshot.value as? NSDictionary else {    // There is no user
                print("No user")
                return
            }
            let keyDict = value["keys"] as? Dictionary<String,Any> ?? [:]
            
            if keyDict.isEmpty {
                self.createPK()
            } else {
                let pubKeyString = keyDict["publicKey"] as? String ?? ""
            }
        })
    }
    
    func createPK() {
        
        var error: Unmanaged<CFError>?
        
        let tag = "com.felicity.felicity.\(Auth.auth().currentUser!.uid)".data(using: .utf8)!
        
        let attributes: [String: Any] =
            [kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
             kSecAttrKeySizeInBits as String: 2048,
             kSecPrivateKeyAttrs as String:
                [kSecAttrIsPermanent as String:
                    true,
                 kSecAttrApplicationTag as String: tag]
        ]
        do {
            guard let privateKey = SecKeyCreateRandomKey(attributes as CFDictionary, &error) else {
                throw error!.takeRetainedValue() as Error
            }
            guard let publicKey = SecKeyCopyPublicKey(privateKey) else {
                throw error!.takeRetainedValue() as Error
            }
            
        } catch {
            print(error);
        }
    }
    /*
     func savePK {
     let key: [String:Any] = ["publicKey" : User.current?.pubKeyString]
     
     if !(Auth.auth().currentUser!.uid).isEmpty
     } */
    
    
    
    func checkPKExists() -> Bool {
        var item: CFTypeRef?
        
        let tag = "com.felicity.felicity.\(Auth.auth().currentUser!.uid)".data(using: .utf8)!
        
        let getQuery: [String:Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag,
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecReturnRef as String: true
        ]
        
        let status = SecItemCopyMatching(getQuery as CFDictionary, &item)
        if status == errSecSuccess {
            let privateKey = item as! SecKey
            guard let publicKey = SecKeyCopyPublicKey(privateKey) else {
                print("Public key error")
                return false
            }
            User.current?.setKeys(privateKey: privateKey, publicKey: publicKey)
            return true
        } else {
            print("Error")
            return false
        }
        
    }
    
    
    
}

