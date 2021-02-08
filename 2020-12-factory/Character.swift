//
//  Character.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//



import Foundation


class Character {
    
    //  XXXXXXXXXXXXXXXXXXXX  PROPERTIES  XXXXXXXXXXXXXXXXXXXX
    var name: String?
    var life = 10
    var weapon: Weapon
    
    var itIsAlive: Bool {
        return life >= 0
    }
    
    
    //  XXXXXXXXXXXXXXXXXXXX INIT  XXXXXXXXXXXXXXXXXXXX
    init(name: String?, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    
    //  XXXXXXXXXXXXXXXXXXXX METHODS  XXXXXXXXXXXXXXXXXXXX
    
    func actionOn(theOneWhoUndergoes: Character) {
        theOneWhoUndergoes.life -= self.weapon.damage
        print("\(theOneWhoUndergoes.name ?? "") has \(theOneWhoUndergoes.life) points of life now ")
    }
}

