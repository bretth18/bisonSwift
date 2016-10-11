//
//  ViewController.swift
//  bisonSwift
//
//  Created by Brett Henderson on 10/10/16.
//  Copyright © 2016 bretth18. All rights reserved.
//
//
//import UIKit
//import Firebase
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let firebaseRef = FIRDatabase.database().reference();
//        
//        firebaseRef.child("newChild").setValue("test value");
//        firebaseRef.child("newArry").setValue(["Mother", "Fucking","Array"]);
//        
//        // looks for children being added
//        firebaseRef.observe(.childAdded, with: { (snapshot) in
//            
//            print("DATABASE CONTENTS \(snapshot)");
//            
//        })
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}

