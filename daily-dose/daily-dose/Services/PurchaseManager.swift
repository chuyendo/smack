//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by mac on 4/11/18.
//  Copyright © 2018 DoThuyHanhChuyen. All rights reserved.
//

import Foundation
import StoreKit

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    static let instance = PurchaseManager()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        <#code#>
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        <#code#>
    }
}
