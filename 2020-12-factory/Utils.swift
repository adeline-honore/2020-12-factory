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
    
    static let rangeArray = 0..<numberCharInPlayer
    static let rangeDigit = 0...9
    static let numberCharInPlayer = 3
    
    
    // to return a string not not empty
    static func readlineValue() -> String {
        var keyboardInput = readLine()
        while keyboardInput!.isEmpty{
            print("Keyboard input is empty, please enter a correct value .")
            keyboardInput = readLine()
        }
        if let valueRL = keyboardInput {
            return valueRL
        }
        return ""
    }
    
    
    // to return an Integer from a readLine()
    static func enteredInteger() -> Int {
                
        // convert entry to integer
        var readlinevalueEntered = Int(readlineValue())
        
        // if the entry is of the type "String"
        while readlinevalueEntered == nil {
            print("this is not a number, please enter a correct value .")
            readlinevalueEntered = Int(readlineValue())
        }
        
        // if the entry is a number strictly greater than 9
        guard let testedValue = readlinevalueEntered else {
            return 0
        }
        while isNumeric(testedValue: testedValue) == false {
            print("Keyboard input is not a digit, please enter a correct value .")
            readlinevalueEntered = Int(readlineValue())
        }
        
        if let numberChoosen = readlinevalueEntered {
            return numberChoosen
        }
        return 0
    }
    
    
    static func isNumeric(testedValue: Int) -> Bool {
        if rangeDigit.contains(Int(testedValue)) {
            return true
        }
        else {
            return false
        }
    }
    
    
    //  XXXXXXXXXXXXXXXXXXXX  STRINGS  XXXXXXXXXXXXXXXXXXXX
    
    // Welcome
    static func welcomme() {
        print("Welcome to the new game from Game Factory.(\n)Two players will compete against each other.(\n)Each player will have three characters on their team.(\n)You have the choice between a Squire, a Knight and an Officer to create a team.(\n)Let's go and good luck.")
    }
    
    // check of characters
    static func theCharacters(player: Player) {
        for (key, value) in ((player.characters.enumerated())) {
            print("enter: \(key) to choose \(value) \(value.name ?? ""), life: \(value.life ), damage: \(value.weapon) ")
        }
    }
    
    // function incorrect entry 
    static func incorrectEntry() {
        print("incorrect entry please start over")
    }
    
    // End of Game
    static func endOfGame(winnerPlayer: String?) {
        print("\(winnerPlayer ?? "" ) is the winner, congratulations !!!")
        print("end of game !!!")
    }
    
    
}
