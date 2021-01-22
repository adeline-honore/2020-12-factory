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
    
    var type: WeaponType
    
    enum WeaponType {
        case woodenWeapon
        case sword
        case laserRay
    }
    
    
    init(damage: Int, WeaponType: WeaponType) {
        self.damage = damage
        self.type = WeaponType
        
        switch WeaponType {
        case .woodenWeapon:
            self.damage = 15
        case .sword:
            self.damage = 30
        case .laserRay:
            self.damage = 50
        }
    }
    
}





