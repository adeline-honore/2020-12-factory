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
    var characters: [Character]
    var choosenChar: Character?
    //var whoIsCaredFor: Character?
    
    var isAlive: Bool {
        var result = false
        characters.forEach { character in
            if character.itIsAlive {
                result = true
            }
        }
        return result
    }
    
    init(name : String?, _ characters: [Character] = []) {
        self.name = name
        self.characters = characters
    }
    
    
    // to choose a character in a team
    func chooseChar(playerchoosed: Player) -> Character? {
        let userChoice = Utils.enteredInteger()
        
        if Utils.range3.contains (userChoice) {
            return playerchoosed.characters[userChoice]
        }
        return nil
    }
}
