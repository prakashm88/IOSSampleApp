//
//  RandomUsers.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class RandomUsers {
	public var results : Array<Results>?
	public var info : Info?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let randomUserList = RandomUsers.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of RandomUsers Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [RandomUsers]
    {
        var models:[RandomUsers] = []
        for item in array
        {
            models.append(RandomUsers(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let RrndomUsers = RandomUsers(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: RandomUsers Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary["results"] != nil) { results = Results.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
		if (dictionary["info"] != nil) { info = Info(dictionary: dictionary["info"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.info?.dictionaryRepresentation(), forKey: "info")

		return dictionary
	}

}
