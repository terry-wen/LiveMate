//
//  ChatViewController.swift
//  LiveMate
//
//  Created by twen6 on 4/6/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var name: String = "Chat"
    var allMessages: [NSDictionary] = [["name" : "Tim", "text" : "Hi Terry", "from" : true],["name" : "Tim", "text" : "Hi Tim", "from" : false], ["name" : "Zeus", "text" : "Hi Zeus", "from" : false]]
    var messages: [NSDictionary] = []
    
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = name
        
        for message in allMessages {
            if message["name"] as! String == name {
                messages.append(message)
            } 
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("chatCell", forIndexPath: indexPath) as! ChatCell
        
        cell.messageFromLabel.text = messages[indexPath.row]["text"] as! String
        
        if messages[indexPath.row]["from"] as! Bool {
            cell.messageFromLabel.textAlignment = NSTextAlignment.Left
        }
            
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    @IBAction func onClose(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        if(messageField.text != "") {
        messages.append(["name" : name, "text" : messageField.text!, "from": false])
        messageField.text = ""
        tableView.reloadData()
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
