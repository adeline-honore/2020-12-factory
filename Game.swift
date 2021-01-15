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
    let whoAttacks: Character?
    let whoIsAttacked : Character?
    
    let attacks: Character?
    let attacked: Character?
    
    // character choosed by user
    let choosed: Character?
    
    //the character who is cared for
    var whoIsCaredFor: Character?

    // account round
    var roundNb = 0
    
    
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
        print("Enter the name of player 1 ")
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
                    if allCharacters.contains(nameChoice!) {
                        print("This name is already existed. Enter an other name of character")
                        let nameChoice = readLine()
                        // mettre utils
                        if let nameChoice = nameChoice {
                            charInstance.name = nameChoice
                        }
                    }
                    playerArray.append(charInstance)
                    allCharacters.append(nameChoice!)
                }
            }
        }
        print(playerArray)
        roundArray += 1
        
        return playerIns
    }
    
    
    // tour à tour
    func round () {
        
        while player1!.isItAlive == true || player2!.isItAlive == true {
            
            // print points of live of players
            playerLife(team: player1!)
            playerLife(team: player2!)
            print("round : \(roundNb)")

            
            //: si numéro du tour est impair alors joueur 1 attaque
            if roundNb % 2 > 0 {
                // player1 attacks
                //print("round : \(roundNb)")
                print(player1!.name!)
                print("who does the action ?")
                let attacks = chooseChar(playerchoosed: player1!)
                print("\(attacks.name) is chosen !")
                
                if attacks is Squire {
                   squireAction()
                }
                else {
                    print("who is attacked ?")
                    let attacked = chooseChar(playerchoosed: player2!)
                    print("\(attacked.name) is attacked !")
                    attack(whoAttacks: attacks, whoIsAttacked: attacked)
                    endOfRound()
                    
                    isSomeOneDead()
                }
            }
            else {
                // player2 attacks
                //print("round : \(roundNb)")
                print(player2!.name!)
                
                print("who does the action ?")
                let attacks = chooseChar(playerchoosed: player2!)
                print("\(attacks.name) is chosen !")
                
                if attacks is Squire {
                    squireAction()
                }
                else {
                    print("who is attacked ?")
                    let attacked = chooseChar(playerchoosed: player1!)
                    print("\(attacked.name) is attacked !")
                    attack(whoAttacks: attacks, whoIsAttacked: attacked)
                    endOfRound()
                    
                    isSomeOneDead()
                }
            }
        }
    }

        
    
   
    
    func randomChest() {
        // random chest
        let chestPresence = Int.random(in: 0..<10)
        let chestDamage = Int.random(in: 0...250)
        
        if chestPresence > 5 {
            print("*************  a chest appears ! ***************")
            print("The weapon it contains causes \(chestDamage) damage")
            whoAttacks!.weapon = chestDamage
            
            print(chestDamage)
            // whoAttacks attacks whoIsAttacked
            whoIsAttacked!.life = whoIsAttacked!.life! - whoAttacks!.weapon
            
            endOfRound()
        }
        else {
            whoIsAttacked!.life = whoIsAttacked!.life! - whoAttacks!.weapon
        }
    }
    
    func care(team: Player) -> Character {
        let carePoint = 35
        whoIsCaredFor = chooseChar(playerchoosed: team)
        whoIsCaredFor!.life = whoIsCaredFor!.life! + carePoint
        return whoIsCaredFor!
    }
    
    func isSomeOneDead() {
        if player2!.playerArray[0].life! + player2!.playerArray[1].life! + player2!.playerArray[2].life! < 0 {
            player2!.isItAlive = false
            print("player 2 is dead, player 1 wins !")
            return
        }
    
        if player1!.playerArray[0].life! + player1!.playerArray[1].life! + player1!.playerArray[2].life! < 0 {
            player1!.isItAlive = false
            print("player 1 is dead, player 2 wins !")
            return
        }
    }

    func squireAction() {
        print("you can care a character (choice 0) or contnue the fight (choice 1)")
        let userChoice = readLine()
        if Int(userChoice!) == 0 {
            care(team: player1!)
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


    func chooseChar(playerchoosed: Player) -> Character {
        print("choose your character : - the first-> 0, - the second: 1, and the third: 2")
        let userChoice = readLine()
        if let userChoice = userChoice {
            if Utils.range3.contains (Int(userChoice)!) {
                let choosed = playerchoosed.playerArray[Int(userChoice)!]
                print(Int(userChoice)!)
                print("you choose : \(choosed.name), his type is :     \(choosed)")
                return choosed
            }
            return choosed!
        }
        print("choosed = \(choosed)")
        return choosed!
    }
    
    

    func attack(whoAttacks: Character, whoIsAttacked: Character) -> Character {
        print("\(whoAttacks) attaks \(whoIsAttacked)")
        print("vie de attacked = \(whoIsAttacked.life)")
        print("arme de tacks : \(whoAttacks.weapon)")
        
        // is there a random chest ?
        randomChest()
        
        print("\(whoIsAttacked) looses \(whoAttacks.weapon) points, his life is now of \(whoIsAttacked.life)")
        
        return whoIsAttacked
    }


    
    
    //  XXXXXXXXXXXXXXXXXXXX  STRINGS  XXXXXXXXXXXXXXXXXXXX
    
    
    
    func playerLife(team: Player) {
       
        player1!.playerArray.forEach{ (Character) in
            print("\(Character.name) has \(Character.life) points of life")
        }
        
        player2!.playerArray.forEach{ (Character) in
            print("\(Character.name) has \(Character.life) points of life")
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
    }
    
}
