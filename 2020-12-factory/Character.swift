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
    
    var itIsAlive: Bool {
        return life >= 0
    }
    
    
    // ----------   INIT
    init(name: String?, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    
    // ----------   FUNCTIONS
    
    func actionOn(theOneWhoUndergoes: Character) {
        theOneWhoUndergoes.life -= self.weapon.damage
        
        print("\(theOneWhoUndergoes.name ?? "") has \(theOneWhoUndergoes.life) points of life now ")
    }
}

