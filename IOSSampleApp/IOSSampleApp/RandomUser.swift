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
    let genders = [Genders.male, Genders.female]
    
    enum Genders:String {
        case male = "Male"
        case female = "Female"
    }
    
    let nats = [Nats.AU, Nats.BR, Nats.CA, Nats.DE, Nats.DK, Nats.ES, Nats.FI, Nats.FR, Nats.GB, Nats.IE, Nats.IR, Nats.NL, Nats.NZ, Nats.TR, Nats.US]
    
    //AU, BR, CA, CH, DE, DK, ES, FI, FR, GB, IE, IR, NL, NZ, TR, US
    enum Nats:String {
        case AU = "AU"
        case BR = "BR"
        case CA = "CA"
        case DE = "DE"
        case DK = "DK"
        case ES = "ES"
        case FI = "FI"
        case FR = "FR"
        case GB = "GB"
        case IE = "IE"
        case IR = "IR"
        case NL = "NL"
        case NZ = "NZ"
        case TR = "TR"
        case US = "US"
    }
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
