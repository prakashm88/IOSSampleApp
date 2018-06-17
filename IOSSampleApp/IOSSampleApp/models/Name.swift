//
//  Name.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation

public class Name: CustomStringConvertible {
    public var description: String
    
	public var title : String?
	public var first : String?
	public var last : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let name_list = Name.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Name Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Name]
    {
        var models:[Name] = []
        for item in array
        {
            models.append(Name(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let name = Name(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Name Instance.
*/
	required public init?(dictionary: NSDictionary) {

		title = dictionary["title"] as? String
		first = dictionary["first"] as? String
		last = dictionary["last"] as? String
        
        description = "Name:- Title: \(String(describing: title)), first: \(String(describing: first)), last: \(String(describing: last))"
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.first, forKey: "first")
		dictionary.setValue(self.last, forKey: "last")

		return dictionary
	}

}
