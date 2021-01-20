//
//  utils.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


//: class Utils
class Utils {
    
    static let range3 = 0...2
    
    static let range2 = 0...1
    
    
    static func readlineValue() -> String? {
        return readLine()
    }
    
    
    // to return an Integer from a readLine()
    func enteredInteger() -> Int {
        let userChoiceNb: Int
        if let userChoice = readLine(){
            let intNb = Int(userChoice)
            if let intNb = intNb {
                print(intNb)
                return intNb
            }
            userChoiceNb = intNb!
            return userChoiceNb
        }
        return userChoiceNb
    }
    
    
    
    //  XXXXXXXXXXXXXXXXXXXX  STRINGS  XXXXXXXXXXXXXXXXXXXX
    
    // check of characters
    static func theCharacters(team: Player) {
        for (key, value) in ((team.characters.enumerated())) {
            print("enter")
            print("\(key) to choose \(value.name) (life : \(value.life), type: \(value)) ")
        }
    }
    
    
    
}
