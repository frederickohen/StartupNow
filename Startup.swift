//
//  Startup.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 11/30/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import FirebaseDatabase


struct Startup {
   
    let name: String
    let location: String
    let market: String
    let website: String
    let founders: String
    let productInfo: String
    let key: String
    let databaseRef: FIRDatabaseReference?


    init(name: String, location: String, market: String, website: String, founders: String, productInfo: String, key: String = "") {
    
    self.name = name
    self.location = location
    self.market = market
    self.website = website
    self.founders = founders
    self.productInfo = productInfo
    self.key = key
    self.databaseRef = nil
        
    
}
    init(snapshot: FIRDataSnapshot) {
       
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        name = snapshotValue["name"] as! String
        location = snapshotValue["location"] as! String
        market = snapshotValue["market"] as! String
        website = snapshotValue["website"] as! String
        founders = snapshotValue["founders"] as! String
        productInfo = snapshotValue["productInfo"] as! String
        databaseRef = snapshot.ref

}
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "location": location,
            "market": market,
            "website": website,
            "founders": founders,
            "productInfo": productInfo
        ]
    }

}



