//
//  InboxViewController.swift
//  LiveMate
//
//  Created by twen6 on 3/30/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var messages: [PFObject] = []
    var users: [String] = ["Tim", "Zeus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        /*let query1 = PFQuery(className:"Message")
        query1.whereKey("fromId", equalTo: PFUser.currentUser()!.objectId!)
        query1.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages from user.")
                // Do something with the found objects
                for message: PFObject in objects! {
                    let username = message.objectForKey("to")!.objectForKey("username") as! String
                    print("\(username)")
                    if !self.users.contains(username) {
                        self.users.append(username)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        let query2 = PFQuery(className:"Message")
        query2.whereKey("toId", equalTo: PFUser.currentUser()!.objectId!)
        query2.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages to user.")
                // Do something with the found objects
                for message: PFObject in objects! {
                    let username = message.objectForKey("from")!.objectForKey("username") as! String
                    print("dog\(username)")
                    if !self.users.contains(username) {
                        self.users.append(username)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        for message in messages {
            let username = message.objectForKey("from")!.objectForKey("username") as! String
            print("dog\(username)")
            if !users.contains(username) {
                users.append(username)
            }
        }*/
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("inboxCell", forIndexPath: indexPath) as! InboxCell
        
        cell.nameLabel.text = users[indexPath.row]
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPathForCell(cell)
            let name = users[indexPath!.row]
            let dViewController = (segue.destinationViewController as! UINavigationController).topViewController as! ChatViewController
            
            dViewController.name = name
        }
    }
}
