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
    
    // creation of characters
    static func createCharacter() -> Character {
        
        var charInstance: Character
        let rangeCharacType = 0..<Game.numberCharType
        
        
        // creation of an instance of Character
        print("Enter 0 to create a Squire,\nenter 1 to create a Knight,\nenter 2 to create a Doctor ")
        var userChoice = Utils.enteredInteger()
        
        // check the entry
        while !rangeCharacType.contains(userChoice) {
            Utils.incorrectEntry()
            print("You have must enter a number between 0 and \(Game.numberCharType-1) ")
            userChoice = Utils.enteredInteger()
        }
        
        switch Int(userChoice) {
        case 0:
            charInstance = Squire()
        case 1:
            charInstance = Knight()
        case 2:
            charInstance = Doctor()
        default :
            charInstance = Squire()
            print("Value not avaible, a Squire character is create")
        }
        
        // Choose character's name
        print("Enter name of character")
        var nameChoice = Utils.readlineValue()
        charInstance.name = nameChoice
        
        // check if the name already exists in characterNames
        while Game.characterNames.contains(nameChoice) {
            Utils.alreadyExists()
            nameChoice = Utils.readlineValue()
            charInstance.name = nameChoice
        }
        // addition of the character name in the table of names
        Game.characterNames.append(nameChoice)
        
        print("\nYou create a \(type(of:charInstance)) named :\(charInstance.name ?? "")\n")
        return charInstance
    }
    
    // check of characters
    static func theCharacters(player: Player) {
        for (key, value) in ((player.characters.enumerated())) {
            if value.itIsAlive == true {
                print("Enter: \(key) to choose \(type(of:value)) named \(value.name ?? ""), life: \(value.life ), damage: \(value.weapon.damage) ")
            }
            else {
                print("Not \(value.name ?? "") because he is dead.")
            }
        }
    }
    
    // to choose a character in a team
    func chooseChar(playerchoosed: Player) -> Character? {
        var userChoice = Utils.enteredInteger()
        
        // check if the entry corresponds to a character
        while !rangeNumChar.contains (userChoice) {
            Utils.incorrectEntry()
            userChoice = Utils.enteredInteger()
        }
        
        while rangeNumChar.contains (userChoice) && playerchoosed.characters[userChoice].itIsAlive == false {
            print("You cannot choose this character because he is dead !")
            userChoice = Utils.enteredInteger()
        }
        return playerchoosed.characters[userChoice]
    }
}
