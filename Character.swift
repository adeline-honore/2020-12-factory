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
    var name: String?
    var life = 10
    var weapon = 0
    var isInLife = true
    
    static var minLife = 0
    
    init(name: String?) {
        self.name = name
        
        if self.life <= 0 {
            isInLife = false
        }
    }
    
    

    
    static func attack(whoAttacks: Character, whoIsAttacked: Character) -> Character {
        print("\(whoAttacks) attaks \(whoIsAttacked)")
                
        // is there a random chest ?
        Game.randomChest(whoAttacks: whoAttacks, whoIsAttacked: whoIsAttacked)
        
        print("\(whoIsAttacked) has \(whoIsAttacked.life) points of life now ")
        
        return whoIsAttacked
    }
    
    /*
    static func care(team: Player) -> Character {
        let carePoint = 35
        let whoIsCaredFor: Character
        print("you will care one of your character  with \(carePoint) points of life!")
        
        //choice of the character
        if let whoIsCaredFor = Game.chooseChar(playerchoosed: Game.attackingTeam) {
            whoIsCaredFor.life += carePoint
        }
        return whoIsCaredFor
    }
    }*/
}


//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 1 : Squire       XXXXXXXXXXXXXXX

class Squire : Character {
    
    init() {
         super.init(name: "")
        life =  75
        weapon = 15
    }
    
    /*
     func squireAction() {
     print("you can care a character (choice 0) or contnue the fight (choice 1)")
     let userChoice = readLine()
     if Int(userChoice!) == 0 {
     Character.care(team: attackingTeam)
     }
     if Int(userChoice!) == 1{
     print("who is attacked ?")
     let attacked = chooseChar(playerchoosed: player2!)
     print("\(attacked.name) is attacked !")
     
     attack(whoAttacks: attacks!, whoIsAttacked: attacked)
     endOfRound()
     
     isSomeOneDead()
     }
     }
     
     */
    
    
    
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 2 : Knight        XXXXXXXXXXXXXXX

class Knight: Character {
    
    init() {
        super.init(name: "")
        life = 115
        weapon = 30
    }
}



//: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//: XXXXXX          SOUS-CLASS 3 : Officer        XXXXXXXXXXXXXXX

class Officer : Character {
    
    //var care : Int
    
    init() {
        super.init(name: "")
        life = 150
        weapon = 50
    }
}




