//
//  Officer.swift
//  factory
//
//  Created by adeline pc on 26/01/2021.
//  Copyright © 2021 adeline pc. All rights reserved.
//

import Foundation



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer: Character {
    
    
    init() {
        super.init(name: "", weapon: Weapon(weaponType: .laserRay))
        life = 115
        weapon = weapon
    }
    
    override func actionOn(theOneWhoUndergoes: Character) {
        print("you will care one of your character")
        
        let carePoint = 35
        theOneWhoUndergoes.life += carePoint
        print("you added \(carePoint) points of life!")
    }
}
