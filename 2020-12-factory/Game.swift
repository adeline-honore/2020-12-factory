//
//  Party.swift
//  factory
//
//  Created by adeline pc on 21/12/2020.
//  Copyright © 2020 adeline pc. All rights reserved.
//

import Foundation



class Game {
    
    //  XXXXXXXXXXXXXXXXXXXX  PROPERTIES  XXXXXXXXXXXXXXXXXXXX
    
    // instantiations of Player
    private var player1: Player?
    private var player2: Player?
    
    var playerNames: [String] = []
    static var characterNames: [String] = []
    
    static let numberCharType = 3
    static let numberCharInPlayer = 3
    
    // account round
    static var roundNb = 0
    
    //  XXXXXXXXXXXXXXXXXXXX METHODS  XXXXXXXXXXXXXXXXXXXX
    
    // initialisation of players
    func start() {
        player1 = createPlayer()
        player2 = createPlayer()
    }
    
    
    
    
    // creation of players
    func createPlayer() -> Player {
        
        // creattion of an instance of player
        let playerIns = Player(name: "")
        
        // Init of player
        print("Enter the name of player ")
        var name = Utils.readlineValue()
        
        while playerNames.contains(name) {
            Utils.alreadyExists()
            name = Utils.readlineValue()
            playerIns.name = name
        }
        playerIns.name = name
        playerNames.append(playerIns.name!)
        
        // creation of the table of characters
        var playerArray = [Character]()
        
        while playerArray.count < Game.numberCharInPlayer {
            let aCharacter: Character = Player.createCharacter()
            playerArray.append(aCharacter)
            playerIns.characters = playerArray
        }
        return playerIns
    }
    
    
    // alternate function
    func round() {
        
        guard let player1 = player1, let player2 = player2 else {
            return
        }
           
        var attackingPlayer = player1
        var attackedPlayer = player2
        
        // are they alive? if so, they fight
        while player1.isAlive && player2.isAlive {

            // incrémentation du nombre de tour
            Game.roundNb += 1
            print("Round n°: \(Game.roundNb)")
            
            // "action" function call
            action(playerWhoAttacks: attackingPlayer, playerWhoIsAttacked: attackedPlayer)
            print("End of round n°: \(Game.roundNb) ! \n")
            
            // swap between players
            swap(&attackedPlayer, &attackingPlayer)
        }
        Utils.endOfGame(winnerPlayer: attackedPlayer, numberOfRound: Game.roundNb, looserPlayer: attackingPlayer)
    }

    
    
    func action(playerWhoAttacks: Player, playerWhoIsAttacked: Player) {
        
        print("\(playerWhoAttacks.name ?? "") choose the character who will do the action :")
        Player.theCharacters(player: playerWhoAttacks)
        guard let theOneWhoDoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoAttacks) else {
            return
        }
        
        if theOneWhoDoes is Doctor {
            print("You choose an Doctor, you will care one of your characters ")
            Player.theCharacters(player: playerWhoAttacks)
            guard let theOneWhoUndergoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoAttacks) else {
                return
            }
            theOneWhoDoes.actionOn(theOneWhoUndergoes: theOneWhoUndergoes)
        }
        else {
            print("\(playerWhoAttacks.name ?? "") choose the character who will undergo the action :")
            Player.theCharacters(player: playerWhoIsAttacked)
            
            guard let theOneWhoUndergoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoIsAttacked) else {
                return
            }
            
            randomChest(theOneWhoDoes: theOneWhoDoes)
            theOneWhoDoes.actionOn(theOneWhoUndergoes: theOneWhoUndergoes)
        }
    }
    
    
    // random chest
    func randomChest(theOneWhoDoes: Character) {
        // presence of random chest
        let chestPresence = Int.random(in: 0..<10)
        
        if chestPresence < 2 {
            print("*************  A chest appears ! ***************")
            let weaponInChest = Weapon(weaponType: .inChest)
            print("The weapon it contains causes \(weaponInChest.damage) points of damage")
            theOneWhoDoes.weapon = weaponInChest
        }
    }
    
    
    //  XXXXXXXXXXXXXXXXXXXX  the game  XXXXXXXXXXXXXXXXXXXX
    
    init() {
        Utils.welcomme()
        start()
        round()
    }
}
