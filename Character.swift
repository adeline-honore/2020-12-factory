//
//  Character.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//


/*
 if life < Character.minLife {
 life = Character.minLife
 isInLife = false
 }
 */


import Foundation


class Character {
    var name : String?
    var life : Int?
    var weapon : Int
    //var isInLife = true
    
    static let minLife = 0
    
    init(name: String?  , life : Int? , weapon : Int) {
        self.name = name
        self.life = life /* -> Int in 0..400  */
        self.weapon = weapon
    }
}


//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 1 : Squire       XXXXXXXXXXXXXXX

class Squire : Character {
    
    init() {
        super.init(name: "Squire", life: 75, weapon: 15)
    }
    
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 2 : Knight        XXXXXXXXXXXXXXX

class Knight: Character {
    
    init() {
        super.init(name: "Knight", life: 115, weapon: 30)
    }

}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer : Character {
    
    //var care : Int
    
    init() {
        super.init(name: "Officer", life: 150, weapon: 50)
    }

}




