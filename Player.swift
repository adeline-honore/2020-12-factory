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
    var whoIsCaredFor: Character?


    
    var isAlive: Bool {
        var result = false
        characters.forEach { character in
            if character.isInLife {
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
    func chooseChar(playerchoosed: Player) -> Character {
        let choosenChar = Character(name: "")
        if let userChoice = readLine(){
            let userChoiceNb = Int(userChoice)
            if let userChoiceNb = userChoiceNb {
                if Utils.range3.contains (userChoiceNb) {
                    let choosenChar = playerchoosed.characters[userChoiceNb]
                    return choosenChar
                }
            }
        }
        return choosenChar
    }
    
    
    
}



    
