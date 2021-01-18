//
//  player.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


class Player {
    var name: String?
    var playerArray: [Character]
    
    var isAlive: Bool {
        var result = false
        playerArray.forEach { Character in
            if Character.isInLife == true {
                result = true
            }
        }
        return result
    }
    
    init(name : String?, _ playerArray: [Character] = []) {
        self.name = name
        self.playerArray = playerArray
    }
    
    
    
}



    
