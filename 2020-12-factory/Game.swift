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
    private var characterNames: [String] = []
    
    // instantiations of Player
    private var player1: Player?
    private var player2: Player?
    
    // presence of random chest
    var chestPresence: Int?
    
    //  XXXXXXXXXXXXXXXXXXXX FUNCTIONS  XXXXXXXXXXXXXXXXXXXX
    
    // initialisation of players
    func start() {
        player1 = createPlayer()
        player2 = createPlayer()
    }
    
    
    // creation of characters
    func createCharacter() -> Character{
        
        var charInstance: Character
        
        // creation of an instance of Character
        print("Enter 0 to create a Squire,\nenter 1 to create a Knight,\nenter 2 to create a Doctor ")
        var userChoice = Utils.enteredInteger()
        
        // check the entry
        while !Utils.rangeArray.contains(userChoice) {
            Utils.incorrectEntry()
            print("you have must enter a number between 0 and \(Utils.numberCharType-1) ")
            userChoice = Utils.enteredInteger()
        }
        
        switch Int(userChoice) {
        case 0:
            charInstance = Squire()
        case 1:
            charInstance = Knight()
        case 2:
            charInstance = Doctor()
        default :
            charInstance = Squire()
            print("value not avaible, a Squire character is create")
        }
        
        // Choose character's name
        print("Enter name of character")
        var nameChoice = Utils.readlineValue()
        charInstance.name = nameChoice
        
        // check if the name already exists in characterNames
        while characterNames.contains(nameChoice) {
            print("This name is already existed. Enter an other name of character")
            nameChoice = Utils.readlineValue()
            charInstance.name = nameChoice
        }
        // addition of the character name in the table of names
        characterNames.append(nameChoice)
        
        print("\nYou create a \(type(of:charInstance)) named :\(charInstance.name ?? "")\n")
        return charInstance
    }
    
    // creation of players
    func createPlayer() -> Player {
        
        // creattion of an instance of player
        let playerIns = Player(name: "")
        
        // Init of player
        print("Enter the name of player ")
        let name = Utils.readlineValue()
        playerIns.name = name
        
        // creation of the table of characters
        var playerArray = [Character]()
        
        while playerArray.count < Utils.numberCharInPlayer {
            let aCharacter: Character = createCharacter()
            playerArray.append(aCharacter)
            playerIns.characters = playerArray
        }
        return playerIns
    }
    
    
    // alternate function
    func round() {
        
        // account round
        var roundNb = 0
        
        guard let player1 = player1, let player2 = player2 else {
            return
        }
   
        var attackingPlayer = player1
        var attackedPlayer = player2
        
        // are they alive? if so, they fight
        while player1.isAlive && player2.isAlive {

            // incrémentation du nombre de tour
            roundNb += 1
            print("Round n°: \(roundNb)")
            
            // "action" function call
            action(playerWhoAttacks: attackingPlayer, playerWhoIsAttacked: attackedPlayer)
            print("fin du round\(roundNb) !")
            
            // swap between players
            swap(&attackedPlayer, &attackingPlayer)
        }
        Utils.endOfGame(winnerPlayer: attackingPlayer.name)
    }

    
    
    func action(playerWhoAttacks: Player, playerWhoIsAttacked: Player) {
        
        print("\(playerWhoAttacks.name ?? "") choose the character who will do the action :")
        Utils.theCharacters(player: playerWhoAttacks)
        guard let theOneWhoDoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoAttacks) else {
            return
        }
        
        if theOneWhoDoes is Doctor {
            print("you choose an Doctor, you will care one of your characters ")
            Utils.theCharacters(player: playerWhoAttacks)
            guard let theOneWhoUndergoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoAttacks) else {
                return
            }
            theOneWhoDoes.actionOn(theOneWhoUndergoes: theOneWhoUndergoes)

        }
        else {
            print("\(playerWhoAttacks.name ?? "") choose the character who will undergo the action :")
            Utils.theCharacters(player: playerWhoIsAttacked)
            
            guard let theOneWhoUndergoes = playerWhoAttacks.chooseChar(playerchoosed: playerWhoIsAttacked) else {
                return
            }
            chestPresence = Int.random(in: 0..<10)
            randomChest(theOneWhoDoes: theOneWhoDoes)
            theOneWhoDoes.actionOn(theOneWhoUndergoes: theOneWhoUndergoes)
        }
    }
    
    
    // random chest
    func randomChest(theOneWhoDoes: Character) {
        guard let chestPresence = chestPresence else {
            return
        }
        if chestPresence < 2 {
            print("*************  a chest appears ! ***************")
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
