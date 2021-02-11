//
//  player.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


class Player {
    
    //  XXXXXXXXXXXXXXXXXXXX  PROPERTIES  XXXXXXXXXXXXXXXXXXXX
    var name: String?
    var characters: [Character] = []
    
    var isAlive: Bool {
        var result = false
        characters.forEach { character in
            if character.itIsAlive {
                result = true
            }
        }
        return result
    }
    
    let rangeNumChar = 0..<Game.numberCharInPlayer
    
    //  XXXXXXXXXXXXXXXXXXXX INIT  XXXXXXXXXXXXXXXXXXXX
    
    init(name: String?) {
        self.name = name
    }
    
    //  XXXXXXXXXXXXXXXXXXXX METHODS  XXXXXXXXXXXXXXXXXXXX
    
    // to choose a character in a team
    func chooseChar(playerchoosed: Player) -> Character? {
        var userChoice = Utils.enteredInteger()
        
        // check if the entry corresponds to a character
        while !rangeNumChar.contains (userChoice) {
            Utils.incorrectEntry()
            userChoice = Utils.enteredInteger()
        }
        
        while rangeNumChar.contains (userChoice) && playerchoosed.characters[userChoice].itIsAlive == false {
            print("you cannot choose this character because he is dead !")
            userChoice = Utils.enteredInteger()
        }
        return playerchoosed.characters[userChoice]
    }
}
