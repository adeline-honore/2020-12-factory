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
    var weapon: Weapon
    
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
        self.weapon = Weapon
    }
    
    
    // ----------   FUNCTIONS
    
    func attack(whoIsAttacked: Character) -> Character {
        whoIsAttacked.life -= self.weapon.damage
        
        print("\(whoIsAttacked) has \(whoIsAttacked.life) points of life now ")
        return whoIsAttacked
    }
}


//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 1 : Squire       XXXXXXXXXXXXXXX

class Squire : Character {
    
    init() {
         super.init(name: "")
        life =  75
        weapon.damage = 15
    }
    
    
     func care(attackingTeam: Player) -> Character {
        let carePoint = 35
        let whoIsCaredFor = Character(name: "")
        print("you will care one of your character  with \(carePoint) points of life!")
        
        //choice of the character
        attackingTeam.whoIsCaredFor = attackingTeam.chooseChar(playerchoosed: attackingTeam)
        if let whoIsCaredFor = attackingTeam.whoIsCaredFor {
            whoIsCaredFor.life += carePoint
        }
         return whoIsCaredFor
     }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 2 : Knight        XXXXXXXXXXXXXXX

class Knight: Character {
    
    init() {
        super.init(name: "")
        life = 115
        weapon.damage = 30
    }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer : Character {
    
    //var care : Int
    
    init() {
        super.init(name: "")
        life = 150
        weapon.damage = 50
    }
}




