//
//  Squire.swift
//  2020-12-factory
//
//  Created by adeline pc on 26/01/2021.
//  Copyright © 2021 adeline pc. All rights reserved.
//

import Foundation



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 1 : Squire       XXXXXXXXXXXXXXX

class Squire: Character {
    
    init() {
        super.init(name: "", weapon: Weapon(weaponType: .sword))
        life =  75
        weapon = weapon
    }
}

