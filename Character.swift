//
//  Character.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//



import Foundation


class Character {
    
    // ----------   PROPERTIES
    var name: String?
    var life = 10
    var weapon = 0
    
    var isInLife: Bool {
        var result = true
        if self.life <= 0 {
            result = false
        }
        return result
    }
    
    static var minLife = 0
    
    
    // ----------   INIT
    init(name: String?) {
        self.name = name
        
    }
    
    
    // ----------   FUNCTIONS
    
    static func attack(whoAttacks: Character, whoIsAttacked: Character, attackedTeam: Player) -> Character {
        print("\(attackedTeam.name) choose the character who will be injured :")
        Utils.theCharacters(team: attackedTeam)
        if whoIsAttacked = Game.chooseChar(playerchoosed: attackedTeam) {
        
        print("the character who will be injured is : \(whoIsAttacked.name) with  \(whoIsAttacked.life) points of life")
        print("\(whoAttacks) attaks \(whoIsAttacked)")
        
        // is there a random chest ?
        let chestPresence = Int.random(in: 0..<10)
        if chestPresence > 5 {
            Game.randomChest(whoAttacks: whoAttacks, whoIsAttacked: whoIsAttacked)
        }
        else {
            print("whoAttacks' points of damge : \(whoAttacks.weapon)")
            Weapon.hurt(whoAttacks: whoAttacks, whoIsAttacked: whoIsAttacked)
            return whoIsAttacked
        }
        print("\(whoIsAttacked) has \(whoIsAttacked.life) points of life now ")
        return whoIsAttacked
    }
    }
    
    
}


//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 1 : Squire       XXXXXXXXXXXXXXX

class Squire : Character {
    
    init() {
         super.init(name: "")
        life =  75
        weapon = 15
    }
    
    
     static func care(attackingTeam: Player) -> Character {
         let carePoint = 35
         let whoIsCaredFor: Character
         print("you will care one of your character  with \(carePoint) points of life!")
        
         //choice of the character
        whoIsCaredFor = Game.chooseChar(playerchoosed: Game.attackingTeam!)
        whoIsCaredFor.life += carePoint
        
         return whoIsCaredFor
     }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 2 : Knight        XXXXXXXXXXXXXXX

class Knight: Character {
    
    init() {
        super.init(name: "")
        life = 115
        weapon = 30
    }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer : Character {
    
    //var care : Int
    
    init() {
        super.init(name: "")
        life = 150
        weapon = 50
    }
}




