//
//  Results.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class Results {
	public var gender : String?
	public var name : Name?
	public var location : Location?
	public var email : String?
	public var login : Login?
	public var dob : String?
	public var registered : String?
	public var phone : String?
	public var cell : String?
	public var id : Id?
	public var picture : Picture?
	public var nat : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
	required public init?(dictionary: NSDictionary) {

		gender = dictionary["gender"] as? String
		if (dictionary["name"] != nil) { name = Name(dictionary: dictionary["name"] as! NSDictionary) }
		if (dictionary["location"] != nil) { location = Location(dictionary: dictionary["location"] as! NSDictionary) }
		email = dictionary["email"] as? String
		if (dictionary["login"] != nil) { login = Login(dictionary: dictionary["login"] as! NSDictionary) }
		dob = dictionary["dob"] as? String
		registered = dictionary["registered"] as? String
		phone = dictionary["phone"] as? String
		cell = dictionary["cell"] as? String
		if (dictionary["id"] != nil) { id = Id(dictionary: dictionary["id"] as! NSDictionary) }
		if (dictionary["picture"] != nil) { picture = Picture(dictionary: dictionary["picture"] as! NSDictionary) }
		nat = dictionary["nat"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.gender, forKey: "gender")
		dictionary.setValue(self.name?.dictionaryRepresentation(), forKey: "name")
		dictionary.setValue(self.location?.dictionaryRepresentation(), forKey: "location")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.login?.dictionaryRepresentation(), forKey: "login")
		dictionary.setValue(self.dob, forKey: "dob")
		dictionary.setValue(self.registered, forKey: "registered")
		dictionary.setValue(self.phone, forKey: "phone")
		dictionary.setValue(self.cell, forKey: "cell")
		dictionary.setValue(self.id?.dictionaryRepresentation(), forKey: "id")
		dictionary.setValue(self.picture?.dictionaryRepresentation(), forKey: "picture")
		dictionary.setValue(self.nat, forKey: "nat")

		return dictionary
	}

}
