//
//  UserData.swift
//  LiveMate
//
//  Created by zeus medina on 3/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import Parse

//This class manges the Artist User type
class ArtistData: NSObject {
    
    func userCreatedArtistProfile() {
        let artist = PFObject(className: "ArtistData")
        artist["author"] = PFUser.currentUser()
        artist["location"] = "Tempe, AZ"
        artist["price"] = 55
        
        artist.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }

    }
}
