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
    
    init (content:String, addedByUser:String, key:String) {
        self.key = key;
        self.content = content;
        self.addedByUser = addedByUser;
        self.itemRef = nil;
    }
    
    init (snapshot:FIRDataSnapshot) {
        key = snapshot.key;
        itemRef = snapshot.ref;
        
        if let yakContent = snapshot.value!["content"] as? String {
            content = yakContent;
        } else {
            content = ""
        }
        
        if let yakUser = snapshot.value!["addedByUser"] as? String {
            addedByUser = yakUser;
        } else {
            content = ""
        }
    }
    
    func toAnyObject() -> AnyObject {
        return ["content": content, "addedByUser": addedByUser]
    }
}

