//
//  RandomUser.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit

class RandomUserRequest: NSObject {
    
    let format:String = "json"
    let gender:String = "male"
    let nat:String = "GB"
    
    
   
}

class RandomUsers: NSObject {
    
    let results = [RandomUser]()
    let info = RandomUsersInfo()
    
}

class RandomUsersInfo: NSObject {
    
    
    let seed:String = ""
    let results:Int = 0
    let page:Int = 0
    let version:String = "1.1"
    
}

class RandomUser: NSObject {
    
    let gender:String = ""
    let name:RandomeUserName = RandomeUserName()
    let picture:RandomUserPicture = RandomUserPicture()
    let email:String = ""
    let phone:String  = ""
    let cell:String = ""
    let nat:String = ""
    
}

class RandomeUserName: NSObject {
    let title:String = ""
    let first:String = ""
    let last:String = ""
}

class RandomUserPicture: NSObject {
    let large:String = ""
    let medium:String = ""
    let thumbnail: String = ""
}
