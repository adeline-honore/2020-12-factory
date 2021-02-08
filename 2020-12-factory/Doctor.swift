//
//  Doctor.swift
//  factory
//
//  Created by adeline pc on 26/01/2021.
//  Copyright © 2021 adeline pc. All rights reserved.
//

import Foundation



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Doctor        XXXXXXXXXXXXXXX

class Doctor: Character {
    
    
    init() {
        super.init(name: "", weapon: Weapon(weaponType: .no))
        life = 115
        weapon = weapon
    }
    
    override func actionOn(theOneWhoUndergoes: Character) {
        
        let carePoint = Int.random(in: 30...50)
        theOneWhoUndergoes.life += carePoint
        print("you added \(carePoint) points of life!")
        print("now \(theOneWhoUndergoes.name ?? "") has \(theOneWhoUndergoes.life) points of life")
    }
}
