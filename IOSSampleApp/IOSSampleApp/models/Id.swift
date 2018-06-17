//
//  Id.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class Id {
	public var name : String?
	public var value : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let id_list = Id.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Id Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Id]
    {
        var models:[Id] = []
        for item in array
        {
            models.append(Id(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let id = Id(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Id Instance.
*/
	required public init?(dictionary: NSDictionary) {

		name = dictionary["name"] as? String
		value = dictionary["value"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.value, forKey: "value")

		return dictionary
	}

}
