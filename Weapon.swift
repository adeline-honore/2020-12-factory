//
//  Weapon.swift
//  factory
//
//  Created by adeline pc on 30/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation

class Weapon {
    
    var damage: Int
    
    init(damage: Int) {
        self.damage = damage
    }
    
    static func hurt(whoAttacks: Character, whoIsAttacked: Character) {
        whoIsAttacked.life -= whoAttacks.weapon
    }
    
    
}






