//
//  Picture.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation
  
public class Picture {
	public var large : String?
	public var medium : String?
	public var thumbnail : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let picture_list = Picture.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Picture Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Picture]
    {
        var models:[Picture] = []
        for item in array
        {
            models.append(Picture(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let picture = Picture(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Picture Instance.
*/
	required public init?(dictionary: NSDictionary) {

		large = dictionary["large"] as? String
		medium = dictionary["medium"] as? String
		thumbnail = dictionary["thumbnail"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.large, forKey: "large")
		dictionary.setValue(self.medium, forKey: "medium")
		dictionary.setValue(self.thumbnail, forKey: "thumbnail")

		return dictionary
	}

}
