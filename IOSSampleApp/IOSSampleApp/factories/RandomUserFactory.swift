//
//  RandomUserFactory.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-17.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit

class RandomUserFactory: NSObject {
    
    public  func randomUsers (from dictionaryArray: [[String: String]]) -> [RandomUsers] {
        return RandomUsers.modelsFromDictionaryArray(array: dictionaryArray as NSArray)
    }

}
