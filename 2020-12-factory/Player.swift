//
//  player.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


class Player {
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
    
    init(name: String?) {
        self.name = name
    }
    
    
    // to choose a character in a team
    func chooseChar(playerchoosed: Player) -> Character? {
        var userChoice = Utils.enteredInteger()
        
        // check if the entry corresponds to a character
        while !Utils.rangeArray.contains (userChoice) {
            Utils.incorrectEntry()
            userChoice = Utils.enteredInteger()
        }
        
        while Utils.rangeArray.contains (userChoice) && playerchoosed.characters[userChoice].itIsAlive == false {
            print("you cannot choose this character because he is dead !")
            userChoice = Utils.enteredInteger()
        }
        return playerchoosed.characters[userChoice]
    }
}
