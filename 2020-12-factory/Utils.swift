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
    static let numberCharType = 3
    
    
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
        /*
        guard let valueToTest = readlinevalueEntered else {
            return 0
        }*/
        //if let valueToTest = readlinevalueEntered {
        //if let valueToTest = readlinevalueEntered {
            while isNumeric(testedValue: readlinevalueEntered!) == false {
                print("Keyboard input is not a digit, please enter a correct value.")
                readlinevalueEntered = Int(readlineValue())
            }
        
            if let numberChoosen = readlinevalueEntered {
                return numberChoosen
            }
        
        //}
        return 0
    }
    
    
    static func isNumeric(testedValue: Int) -> Bool {
        if rangeDigit.contains(Int(testedValue)) {
            //print(testedValue)
            return true
        }
        else {
            //print(testedValue)
            return false
        }
    }
    
    
    //  XXXXXXXXXXXXXXXXXXXX  STRINGS  XXXXXXXXXXXXXXXXXXXX
    
    // Welcome
    static func welcomme() {
        print("Welcome to the new game from Game Factory.\nTwo players will compete against each other.\nEach player will have three characters on their team.\nYou have the choice between a Squire, a Knight and a Doctor to create a team.\n Let's go and good luck! \n")
        print("*********************************************** \n")
    }
    
    // check of characters
    static func theCharacters(player: Player) {
        for (key, value) in ((player.characters.enumerated())) {
            print("enter: \(key) to choose \(type(of:value)) named \(value.name ?? ""), life: \(value.life ), damage: \(value.weapon.damage) ")
        }
    }
    
    // function incorrect entry
    static func incorrectEntry() {
        print("incorrect entry please start over")
    }
    
    // End of Game
    static func endOfGame(winnerPlayer: String?) {
        print("\n******************   end of game !!!   ******************\n")
        print("congratulations !!! \n\(winnerPlayer ?? "" ) you are the winner! ")
    }
    
    
}
