//
//  Database.swift
//  bisonSwift
//
//  Created by Brett Henderson on 10/10/16.
//  Copyright © 2016 bretth18. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

struct Yak {
    
    let key:String!;
    let content:String!;
    let addedByUser:String!;
    let itemRef:FIRDatabaseReference? // arbitrary
    
    init (content:String, addedByUser:String, key:String = "") {
        self.key = key;
        self.content = content;
        self.addedByUser = addedByUser;
        self.itemRef = nil;
    }
    
    init (snapshot:FIRDataSnapshot) {
        key = snapshot.key;
        itemRef = snapshot.ref;
        
        // cast type from Any to NSDict
        let snapshotValue = snapshot.value as? NSDictionary;
        
        if let yakContent = snapshotValue!["content"] as? String {
            content = yakContent
        } else {
            content = ""
        }
        
        if let yakUser = snapshotValue!["addedByUser"] as? String {
            addedByUser = yakUser;
        } else {
            addedByUser = ""
        }
    }
    
    func toAnyObject() -> NSDictionary {
        return ["content": content, "addedByUser": addedByUser];
    }
}

