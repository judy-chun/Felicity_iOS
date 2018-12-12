//
//  NetworkActivityIndicatorManager.swift
//  Feelicity
//
//  Created by Sonal Prasad on 12/12/18.
//  Copyright © 2018 Feelicity. All rights reserved.
//

import UIKit

class NetworkActivityIndicatorManager: NSObject {
    
    static let shared = NetworkActivityIndicatorManager()
    private var loadingCount = 0
    
    func networkOperationStarted() {
        
        #if os(iOS)
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        loadingCount += 1
        #endif
    }
    
    func networkOperationFinished() {
        #if os(iOS)
        if loadingCount > 0 {
            loadingCount -= 1
        }
        if loadingCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        #endif
    }
}
