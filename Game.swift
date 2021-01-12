//
//  Party.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


class Game {
    
    // table of character names
    var allCharacters: [String]?
    
    // instantiation of Player
    var player1: Player?
    
    var player2: Player?

    
    init() {
        start()
    }
    
    // initialisation des players
    func start() {
        player1 = createPlayer()
        player2 = createPlayer()
    }
    
    // creation des players
    func createPlayer() -> Player {
        
        // creattion d'une instance de player
        //var playerIns: Player
        let playerIns = Player(name: "")
        
        // Init du player
        print("Enter the name of player 1 ")
        //let name = readLine()
        if let name = readLine() {
            playerIns.name = name
        }
        
        // creation du tableau des personnages
        var playerArray = [Character]()
        //var allCharacters = [String]()
        var roundArray = 0
        
        while playerArray.count <= 2 {
            // creation d'une instance de Char arrive après le choix
            var charInstance: Character
            
            
            print("Enter 0 to create a Squire, 1 to create a Knight, 2 to create a Officer ")
            let userChoice = readLine()
            // mettre Utils range
            
            
            if let userChoice = userChoice {
                if Utils.range3.contains (Int(userChoice)!) {
                    switch Int(userChoice) {
                    case 0:
                        charInstance = Squire()
                    case 1:
                        charInstance = Knight()
                    case 2:
                        charInstance = Officer()
                    default :
                        charInstance = Squire()
                        print("value not avaible, a Squire character is create")
                    }
                    
                    print("Enter name of character")
                    let nameChoice = readLine()
                    if let nameChoice = nameChoice {
                        charInstance.name = nameChoice
                    }
                    if allCharacters!.contains(nameChoice!) {
                        print("This name is already existed. Enter an other name of character")
                        let nameChoice = readLine()
                        // mettre utils
                        if let nameChoice = nameChoice {
                            charInstance.name = nameChoice
                        }
                    }
                    playerArray.append(charInstance)
                    allCharacters!.append(nameChoice!)
                }
            }
            
        }
        print(playerArray)
        roundArray += 1
        
        
        return playerIns
        
    }
    
    
    // tour à tour
    func round () {
        // account round
        var roundNb = 0
        
        // choice of protagonists
        var whoAttacks: Character
        var whoIsAttacked : Character
        
        
        while player1!.isItAlive == true || player2!.isItAlive == true {
            
            print("Points de vie de Team 1, (: \(player1!.playerArray![0].life! + player1!.playerArray![1].life! + player1!.playerArray![2].life!)), \(player1!.playerArray![0].name): \(player1!.playerArray![0].life!) , \(player1!.playerArray![1].name): \(player1!.playerArray![1].life!) , \(player1!.playerArray![2].name): \(player1!.playerArray![2].life!)")
            
            print("Points de vie de Team 2, (: \(player2!.playerArray![0].life! + player2!.playerArray![1].life! + player2!.playerArray![2].life!)) \(player2!.playerArray![0].name): \(player2!.playerArray![0].life!) , \(player2!.playerArray![1].name): \(player2!.playerArray![1].life!) , \(player2!.playerArray![2].name): \(player2!.playerArray![2].life!)")
            //: si numéro du tour est impair alors joueur 1 attaque
            if roundNb % 2 > 0 {
                print("round : \(roundNb)")
                print(player1!.name!)
                // player1 attacks
                print("who attacks ?")
                
                let attacks = readLine()
                if let attacks = attacks {
                    if Utils.range3.contains (Int(attacks)!) {
                        switch Int(attacks) {
                        case 0:
                            whoAttacks = (player1?.playerArray![0])!
                        case 1:
                            whoAttacks = (player1?.playerArray![1])!
                        case 2:
                            whoAttacks = (player1?.playerArray![2])!
                        default:
                            whoAttacks = (player1?.playerArray![0])!
                        }
                        
                        print("\(whoAttacks) attacks !")
                        
                        print("\(String(describing: whoAttacks.name)) attacks !")
                        print("who is attacked ?")
                        let attacked = readLine()
                        if let attacked = attacked {
                            if Utils.range3.contains(Int(attacked)!) {
                                switch Int(attacked) {
                                case 0:
                                    whoIsAttacked = (player2?.playerArray![0])!
                                case 1:
                                    whoIsAttacked = (player2?.playerArray![1])!
                                case 2:
                                    whoIsAttacked = (player2?.playerArray![2])!
                                default:
                                    whoIsAttacked = (player2?.playerArray![0])!
                                }
                                print("\(String(describing: whoIsAttacked.name)) is attacked !")
                                
                                // random chest
                                let chestPresence = Int.random(in: 0..<10)
                                let chestDamage = Int.random(in: 0...250)
                                
                                if chestPresence > 5 {
                                    print("*************  a chest appears ! ***************")
                                    print("The weapon it contains causes \(chestDamage) damage")
                                    whoAttacks.weapon = chestDamage
                                    
                                    print(chestDamage)
                                    // whoAttacks attacks whoIsAttacked
                                    whoIsAttacked.life = whoIsAttacked.life! - whoAttacks.weapon
                                    
                                    print("Round \(roundNb): \(whoAttacks) attaque \(whoIsAttacked) ")
                                    print("Il reste \(String(describing: whoIsAttacked.life)) points de vie à \(String(describing: whoIsAttacked.name))")
                                    print("fin du round\(roundNb) !")
                                }
                                else {
                                
                                // whoAttacks attacks whoIsAttacked
                                whoIsAttacked.life = whoIsAttacked.life! - whoAttacks.weapon
                                
                                print("Round \(roundNb): \(whoAttacks) attaque \(whoIsAttacked) ")
                                print("Il reste \(String(describing: whoIsAttacked.life)) points de vie à \(String(describing: whoIsAttacked.name))")
                                print("fin du round\(roundNb) !")
                                }
                                
                                if player2!.playerArray![0].life! + player2!.playerArray![1].life! + player2!.playerArray![2].life! < 0 {
                                    player2!.isItAlive = false
                                    print("player 2 is dead, player 1 wins !")
                                    return
                                }
                                
                                if player1!.playerArray![0].life! + player1!.playerArray![1].life! + player1!.playerArray![2].life! < 0 {
                                    player1!.isItAlive = false
                                    print("player 1 is dead, player 2 wins !")
                                    return
                                }
                                
                                // next turn
                                roundNb += 1
                            }
                        }
                    }
                }
            }
                //: sinon c'est que le numéro du tour est pair alors joueur 2 attaque
            else {
                print("round : \(roundNb)")
                print(player2!.name!)
                // player2 attack
                print("who attacks ?")
                
                let attacks = readLine()
                if let attacks = attacks {
                    if Utils.range3.contains (Int(attacks)!) {
                        switch Int(attacks) {
                        case 0:
                            whoAttacks = (player2?.playerArray![0])!
                        case 1:
                            whoAttacks = (player2?.playerArray![1])!
                        case 2:
                            whoAttacks = (player2?.playerArray![2])!
                        default:
                            whoAttacks = (player2?.playerArray![0])!
                        }
                        print("\(String(describing: whoAttacks.name)) attacks !")
                        
                        print("who is attacked ?")
                        let attacked = readLine()
                        if let attacked = attacked {
                            if Utils.range3.contains(Int(attacked)!) {
                                switch Int(attacked) {
                                case 0:
                                    whoIsAttacked = (player1?.playerArray![0])!
                                case 1:
                                    whoIsAttacked = (player1?.playerArray![1])!
                                case 2:
                                    whoIsAttacked = (player1?.playerArray![2])!
                                default:
                                    whoIsAttacked = (player1?.playerArray![0])!
                                }
                                print("\(whoIsAttacked) is attacked !")
                                
                                // random chest
                                let chestPresence = Int.random(in: 0..<10)
                                let chestDamage = Int.random(in: 0...250)
                                
                                if chestPresence > 5 {
                                    print("*************  a chest appears ! ***************")
                                    print("The weapon it contains causes \(chestDamage) damage")
                                    whoAttacks.weapon = chestDamage
                                    
                                    print(chestDamage)
                                   
                                    // whoAttacks attacks whoIsAttacked
                                    whoIsAttacked.life = whoIsAttacked.life! - whoAttacks.weapon
                                    
                                    print("Round \(roundNb): \(whoAttacks) attaque \(whoIsAttacked) ")
                                    print("Il reste \(String(describing: whoIsAttacked.life)) points de vie à \(String(describing: whoIsAttacked.name))")
                                    print("fin du round\(roundNb) !")
                                }
                                else {
                                    
                                    // whoAttacks attacks whoIsAttacked
                                    whoIsAttacked.life = whoIsAttacked.life! - whoAttacks.weapon
                                    
                                    print("Round \(roundNb): \(whoAttacks) attaque \(whoIsAttacked) ")
                                    print("Il reste \(String(describing: whoIsAttacked.life)) points de vie à \(String(describing: whoIsAttacked.name))")
                                    print("fin du round\(roundNb) !")
                                }
                                
                                if player2!.playerArray![0].life! + player2!.playerArray![1].life! + player2!.playerArray![2].life! < 0 {
                                    player2!.isItAlive = false
                                    print("player 2 is dead, player 1 wins !")
                                    return
                                }
                                
                                if player1!.playerArray![0].life! + player1!.playerArray![1].life! + player1!.playerArray![2].life! < 0 {
                                    player1!.isItAlive = false
                                    print("player 1 is dead, player 2 wins !")
                                    return
                                }
                                
                                // next turn
                                roundNb += 1
                                
                            }
                        }
                    }
                }
            }
        }
    }

}
