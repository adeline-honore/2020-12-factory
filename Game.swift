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
    
    var attacks: Character?
    var attacked: Character?
    
    // character choosed by user
    static var choosed: Character?
    
    //the character who is cared for
    static var whoIsCaredFor: Character?

    // account round
    var roundNb = 0
    
    
    static var attackingTeam: Player?
    static var attackedteam: Player?
    
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
                    playerIns.playerArray = playerArray
                }
            }
        }
        roundArray += 1
        
        return playerIns
    }
  
    // fonction tour à tour
    func round() {
        
        // do players exist ?
        if let player1 = player1,  let player2 = player2 {
            
            // alternately
            while player1.isItAlive == true || player2.isItAlive == true {
                
                // incrémentation du nombre de tour
                roundNb += 1
                print("Round n°: \(roundNb)")
                
                // calcul du modulo du numero du tour
                let roundModulo: Int
                roundModulo = roundNb % 2
                print("modulo du tour = \(roundModulo)")
                
                if roundModulo > 0 {
                    Game.attackingTeam = player1
                    Game.attackedteam = player2
                }
                else {
                    Game.attackingTeam = player2
                    Game.attackedteam = player1
                }
                // "action" function call
                action(attackingTeam: Game.attackingTeam!, attackedTeam: Game.attackedteam!)
            }
        }
    }
    
    
    func action(attackingTeam: Player, attackedTeam: Player) {
        isSomeOneDead()
        print("\(attackingTeam.name) choose the character who will do the action :")
        Game.theCharacters(team: attackingTeam)
        whoAttacks = Game.chooseChar(playerchoosed: attackingTeam)
        if let whoAttacks = whoAttacks{
            print("the character who will do the action is \(whoAttacks.name) with \(whoAttacks.life) points of life")
            
            print("\(attackedTeam.name) choose the character who will be injured :")
            Game.theCharacters(team: attackedTeam)
            whoIsAttacked = Game.chooseChar(playerchoosed: attackedTeam)
            if let whoIsAttacked = whoIsAttacked {
                print("the character who will be injured is : \(whoIsAttacked.name) with  \(whoIsAttacked.life) points of life")
                Character.attack(whoAttacks: whoAttacks, whoIsAttacked: whoIsAttacked)
            }
        }
    }
    
   
    // random chest
    static func randomChest(whoAttacks: Character, whoIsAttacked: Character) -> Int {
        let chestPresence = Int.random(in: 0..<10)
        let chestDamage = Int.random(in: 0...250)
        
        if chestPresence > 5 {
            print("*************  a chest appears ! ***************")
            print("The weapon it contains causes \(chestDamage) points of damage")
            whoIsAttacked.life -= chestDamage
            
            return whoIsAttacked.life
        }
        else {
            print("whoAttacks' points of damge : \(whoAttacks.weapon)")
            Weapon.hurt(whoAttacks: whoAttacks, whoIsAttacked: whoIsAttacked)
            return whoIsAttacked.life
        }
    }
    
    // fonction qui va disparaitre
    func isSomeOneDead() {
        print("is player1 alive ? \(player1?.isAlive)")
        print("is player2 alive ? \(player2?.isAlive)")
    }
 
    // to choose a character in a team
    static func chooseChar(playerchoosed: Player) -> Character {
        let charChoosen: Character
            if let userChoice = readLine(){
            let userChoiceNb = Int(userChoice)
                if let userChoiceNb = userChoiceNb {
                    if Utils.range3.contains (userChoiceNb) {
                        let choosed = playerchoosed.playerArray[userChoiceNb]
                        return choosed
                    }
                }
            }
        return Character(name: "")
    }
    
    //  XXXXXXXXXXXXXXXXXXXX  STRINGS  XXXXXXXXXXXXXXXXXXXX
    
    // check of characters
    static func theCharacters(team: Player) {
        for (key, value) in ((team.playerArray.enumerated())) {
            print("enter")
            print("\(key) to choose \(value.name) (life : \(value.life), type: \(value)) ")
        }
    }
    
    func endOfRound() {
        print("fin du round\(roundNb) !")
        // next turn
        roundNb += 1
    }
    
    //  XXXXXXXXXXXXXXXXXXXX  the game  XXXXXXXXXXXXXXXXXXXX
    
   
    //  XXXXXXXXXXXXXXXXXXXX  INIT() XXXXXXXXXXXXXXXXXXXX
    init() {
        start()
        gameLogic()
        round()
    }
}

