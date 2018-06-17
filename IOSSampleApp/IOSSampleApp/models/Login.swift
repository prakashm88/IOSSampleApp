//
//  Login.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class Login {
	public var username : String?
	public var password : String?
	public var salt : String?
	public var md5 : String?
	public var sha1 : String?
	public var sha256 : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let login_list = Login.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Login Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Login]
    {
        var models:[Login] = []
        for item in array
        {
            models.append(Login(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let login = Login(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Login Instance.
*/
	required public init?(dictionary: NSDictionary) {

		username = dictionary["username"] as? String
		password = dictionary["password"] as? String
		salt = dictionary["salt"] as? String
		md5 = dictionary["md5"] as? String
		sha1 = dictionary["sha1"] as? String
		sha256 = dictionary["sha256"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.username, forKey: "username")
		dictionary.setValue(self.password, forKey: "password")
		dictionary.setValue(self.salt, forKey: "salt")
		dictionary.setValue(self.md5, forKey: "md5")
		dictionary.setValue(self.sha1, forKey: "sha1")
		dictionary.setValue(self.sha256, forKey: "sha256")

		return dictionary
	}

}
