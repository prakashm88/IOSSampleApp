//
//  Location.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class Location {
	public var street : String?
	public var city : String?
	public var state : String?
	public var postcode : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let location_list = Location.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Location Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Location]
    {
        var models:[Location] = []
        for item in array
        {
            models.append(Location(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let location = Location(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Location Instance.
*/
	required public init?(dictionary: NSDictionary) {

		street = dictionary["street"] as? String
		city = dictionary["city"] as? String
		state = dictionary["state"] as? String
		postcode = dictionary["postcode"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.street, forKey: "street")
		dictionary.setValue(self.city, forKey: "city")
		dictionary.setValue(self.state, forKey: "state")
		dictionary.setValue(self.postcode, forKey: "postcode")

		return dictionary
	}

}
