//
//  Message.swift
//  GameOfChats
//
//  Created by Weijie Lin on 6/8/17.
//  Copyright © 2017 Weijie Lin. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var toId: String?
    
    func chatPartnerId() -> String? {
        
        return fromId == FIRAuth.auth()?.currentUser?.uid ? toId : fromId

    }
    
}
