//
//  Info.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import Foundation
  
public class Info: CustomStringConvertible {
    public var description: String
    
	public var seed : String?
	public var results : Int?
	public var page : Int?
	public var version : Double?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let info_list = Info.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Info Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Info]
    {
        var models:[Info] = []
        for item in array
        {
            models.append(Info(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let info = Info(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Info Instance.
*/
	required public init?(dictionary: NSDictionary) {

		seed = dictionary["seed"] as? String
		results = dictionary["results"] as? Int
		page = dictionary["page"] as? Int
		version = dictionary["version"] as? Double
        
        description = "Info:- seed: \(String(describing: seed)), results: \(String(describing: results)), page: \(String(describing: page)), version: \(String(describing: version)) "
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.seed, forKey: "seed")
		dictionary.setValue(self.results, forKey: "results")
		dictionary.setValue(self.page, forKey: "page")
		dictionary.setValue(self.version, forKey: "version")

		return dictionary
	}

}
