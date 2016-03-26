//
//  ProfileViewController.swift
//  LiveMate
//
//  Created by zeus medina on 3/25/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

let logoutNotification = "User Logged Out\n"

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    
    
    let user = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Sets the user's email and username onto the view
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogoutButton(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) ->
            Void in
            
            if let error = error {
                
                NSLog("Error during logout:\n\(error.localizedDescription)")
            }
            else {
                
                NSLog("Logout Success")
                NSNotificationCenter.defaultCenter().postNotificationName(logoutNotification, object: nil)
                
                
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
