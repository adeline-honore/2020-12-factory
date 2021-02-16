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
    
    //  XXXXXXXXXXXXXXXXXXXX  PROPERTIES  XXXXXXXXXXXXXXXXXXXX
    
    static let rangeDigit = 0...9
    
    
    //  XXXXXXXXXXXXXXXXXXXX METHODS  XXXXXXXXXXXXXXXXXXXX
    
    // to return a string not not empty
    static func readlineValue() -> String {
        var keyboardInput = readLine()
        while keyboardInput!.isEmpty {
            print("Keyboard input is empty, please enter a correct value.")
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
            print("This is not a number, please enter a correct value.")
            readlinevalueEntered = Int(readlineValue())
        }
        
        while isNumeric(testedValue: readlinevalueEntered!) == false {
            print("Keyboard input is not a digit, please enter a correct value.")
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
    
    
    //  -----------  STRINGS
    
    // Welcome
    static func welcomme() {
        print("Welcome to the new game from Game Factory.\nTwo players will compete against each other.\nEach player will have three characters in his team.\nYou have the choice between a Squire, a Knight and a Doctor to create a team.\nLet's go and good luck! \n")
        print("*********************************************** \n")
    }
    
    // function incorrect entry
    static func incorrectEntry() {
        print("Incorrect entry please start over.")
    }
    
    // function incorrect entry
    static func alreadyExists() {
        print("This name already exists, please enter an other name.")
    }
    
    // End of Game
    static func endOfGame(winnerPlayer: Player, numberOfRound: Int, looserPlayer: Player) {
        print("******************   End of game !!!   ******************\n")
        print("Congratulations !!! \n\(winnerPlayer.name ?? "" ) you are the winner!")
        
        print("\nThe game lasted for \(Game.roundNb) rounds \n")
        print("Here are the statistics of the players")
        print(winnerPlayer.name ?? "")
        for (_, value) in ((winnerPlayer.characters.enumerated())) {
            print("- the \(type(of:value)) named \(value.name ?? "") has \(value.life ) points of life ")
            
        }
        print("--------------------")
        print(looserPlayer.name ?? "")
        for (_, value) in ((looserPlayer.characters.enumerated())) {
            print("- the \(type(of:value)) named \(value.name ?? "") has \(value.life ) points of life ")
            
        }
        
    }
}
