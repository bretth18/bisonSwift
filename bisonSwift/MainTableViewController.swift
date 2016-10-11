//
//  MainTableViewController.swift
//  
//
//  Created by Brett Henderson on 10/10/16.
//
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MainTableViewController: UITableViewController {
    
    var dbRef:FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference().child("yak-posts")

        // firebase shit
        let firebaseRef = FIRDatabase.database().reference();
        
        
        // looks for children being added
        firebaseRef.observe(.childAdded, with: { (snapshot) in
            
            print("DATABASE CONTENTS \(snapshot)");
            
        });
        
        // login user
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            if (error != nil) {
                print("error creating anonymous login");
                return;
            }
            
            print("user logged in with uid: " + user!.uid);
        }
        
    }
    
    
    // handles adding new posts on button press
    @IBAction func addYak(_ sender: AnyObject) {
        
        let yakAlert = UIAlertController(title: "New Yak", message: "Enter your yak", preferredStyle: .alert);
        
        yakAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "your post"
        }
        
        yakAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
            if let yakContent = yakAlert.textFields?.first?.text {
                let yak = Yak(content: yakContent, addedByUser: "username")
                
                let yakRef = self.dbRef.child(yakContent.lowercased())
                
                yakRef.setValue(yak.toAnyObject())
            }
        
        }))
        
        self.present(yakAlert, animated: true, completion: nil);
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }



}
