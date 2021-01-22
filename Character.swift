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
    //var damage: Int
    
    var isInLife: Bool {
        var result = true
        if self.life <= 0 {
            result = false
        }
        return result
    }
    
    
    
    static var minLife = 0
    
    
    // ----------   INIT
    init(name: String?, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
        
        
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
         super.init(name: "", weapon: weapon)
        life =  75
        weapon = weapon
    }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 2 : Knight        XXXXXXXXXXXXXXX

class Knight: Character {
    
    init() {
        super.init(name: "", weapon: weapon)
        life = 115
        weapon = weapon
    }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer : Character {
    
    //var care : Int
    
    init() {
        super.init(name: "", weapon: weapon)
        life = 150
        weapon = weapon
    }
    
    
    func care(whoIsCaredFor: Character) -> Character {
        let carePoint = 35
        whoIsCaredFor.life += carePoint
        print("you added \(carePoint) points of life!")
        
        return whoIsCaredFor
    }
}




