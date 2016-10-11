//
//  User.swift
//  bisonSwift
//
//  Created by Brett Henderson on 10/10/16.
//  Copyright © 2016 bretth18. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase


struct User {
    
    let uid:String;
    
    init(userData:FIRUser) {
        uid = userData.uid;
        
    }
    
    init(uid:String) {
        self.uid = uid;
    }
}
