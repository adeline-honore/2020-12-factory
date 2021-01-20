//
//  Party.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation


class Game {
    
    //  XXXXXXXXXXXXXXXXXXXX  CONSTANTES  &  VARIABLES  XXXXXXXXXXXXXXXXXXXX
    
    // table of character names
    var allCharacters: [String] = []
    
    // instantiations of Player
    var player1: Player?
    var player2: Player?
    
    // choice of protagonists
    var whoAttacks: Character?
    var whoIsAttacked : Character?
    
    // account round
    var roundNb = 0
    
    // presence of random chest
    var chestPresence: Int?
    
    // who attacks?
    var attackingTeam: Player?
    var attackedteam: Player?
    
    //  XXXXXXXXXXXXXXXXXXXX FUNCTIONS  XXXXXXXXXXXXXXXXXXXX
    
    // initialisation of players
    func start() {
        player1 = createPlayer()
        player2 = createPlayer()
    }
    
    func gameLogic() {
        guard let player1 = player1, let player2 = player2 else {
            return
        }
    }
    
    
    
    // creation of players
    func createPlayer() -> Player {
        
        // creattion of an instance of player
        let playerIns = Player(name: "", [])
        
        // Init du player
        print("Enter the name of player ")
        if let name = readLine() {
            playerIns.name = name
        }
        
        // creation du tableau des personnages
        var playerArray = [Character]()
        var roundArray = 0
        
        while playerArray.count <= 2 {
            
            // creation d'une instance de Char arrive après le choix
            var charInstance: Character
            
            
            print("Enter 0 to create a Squire, 1 to create a Knight, 2 to create a Officer ")
            let userChoice = readLine()
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
                    
                        // vérif dans allCharacters
                        if allCharacters.contains(nameChoice) {
                            print("This name is already existed. Enter an other name of character")
                            let nameChoice = readLine()
                            // mettre utils
                            if let nameChoice = nameChoice {
                                charInstance.name = nameChoice
                            }
                        }
                        allCharacters.append(nameChoice)

                    }
                    playerArray.append(charInstance)
                    playerIns.characters = playerArray
                }
            }
        }
        roundArray += 1
        
        return playerIns
    }
    
    func swapPlayers(_a: inout Player, _b: inout Player) {
        let temporaryA = _a
        _a = _b
        _b = temporaryA
    }
  
    // fonction tour à tour
    func round() {
        
        // do players exist ?
        if let player1 = player1,  let player2 = player2 {
            
            // are they alive? if so, they fight
            while player1.isAlive && player2.isAlive {
                print(player1.isAlive)
                print(player2.isAlive)
                
                // incrémentation du nombre de tour
                roundNb += 1
                print("Round n°: \(roundNb)")
                
                
                // "action" function call
                action(attackingTeam: attackingTeam!, attackedTeam: attackedteam!)
                print("fin du round\(roundNb) !")
                swapPlayers(_a: &attackingTeam!, _b: &attackedteam!)
            }
            return
        }
        print("end of game!!!")
        return
    }
    
    
    func action(attackingTeam: Player, attackedTeam: Player) {
        print("\(attackingTeam.name) choose the character who will do the action :")
        Utils.theCharacters(team: attackingTeam)
        attackingTeam.chooseChar(playerchoosed: attackingTeam)
        whoAttacks = attackingTeam.choosenChar
        if let whoAttacks = whoAttacks{
            print("the character who will do the action is \(whoAttacks.name)")
            print("\(attackingTeam.name) choose the character who will be injured :")
            Utils.theCharacters(team: attackedTeam)
            attackingTeam.chooseChar(playerchoosed: attackedTeam)
            whoIsAttacked = attackingTeam.choosenChar
            if let whoIsAttacked = whoIsAttacked {
                /*
                // is there a random chest ?
                chestPresence = Int.random(in: 0..<10)
                randomChest(whoIsAttacked: whoIsAttacked)
                print(whoIsAttacked.life)
                */
                whoAttacks.attack(whoIsAttacked: whoIsAttacked)
            }
        }
    }
    
    
   
    // random chest
    func randomChest(whoIsAttacked: Character) -> Character {
        if let chestPresence = chestPresence {
            if chestPresence < 2 {
                let chestDamage = Int.random(in: 0...250)
                print("*************  a chest appears ! ***************")
                print("The weapon it contains causes \(chestDamage) points of damage")
                whoIsAttacked.life -= chestDamage
                
                return whoIsAttacked
            }
        }
        return whoIsAttacked
    }
    
    
    
    
    //  XXXXXXXXXXXXXXXXXXXX  the game  XXXXXXXXXXXXXXXXXXXX
    
    init() {
        start()
        gameLogic()
        round()
    }
}

