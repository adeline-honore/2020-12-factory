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
    var characterNames: [String] = []
    
    // instantiations of Player
    var player1: Player?
    var player2: Player?
    
    // choice of protagonists
    var theOneWhoDoes: Character?
    var theOneWhoUndergoes: Character?
    
    // account round
    var roundNb = 0
    
    // presence of random chest
    var chestPresence: Int?
    
    // who attacks?
    var attackingTeam: Player?
    var attackedTeam: Player?
    
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
    
    // creation of characters
    func createCharacter() -> Character{
        
        var charInstance: Character
        
        // creation of an instance of Character
        print("Enter 0 to create a Squire,(\n)enter 1 to create a Knight,(\n)enter 2 to create a Officer ")
        let userChoice = Utils.enteredInteger()
        
        // check the entry
        while !Utils.range3.contains(userChoice) {
            Utils.incorrectEntry()
        }
        
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
        
        // Choose character's name
        print("Enter name of character")
        let nameChoice = Utils.readlineValue()
        charInstance.name = nameChoice
        
        // check if the name already exists in characterNames
        while characterNames.contains(nameChoice) {
            print("This name is already existed. Enter an other name of character")
            let nameChoice = Utils.readlineValue()
            charInstance.name = nameChoice
        }
        // addition of the character name in the table of names
        characterNames.append(nameChoice)
        
        print(charInstance)
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
        
        while playerArray.count < Utils.numberCharInTeam {
            let aCharacter: Character = createCharacter()
            playerArray.append(aCharacter)
            playerIns.characters = playerArray
        }
        return playerIns
    }
    
    
    // alternate function
    func round() {
        
        // do players exist ?
        if let player1 = player1,  let player2 = player2 {
            attackingTeam = player1
            attackedTeam = player2
            
            // are they alive? if so, they fight
            while player1.isAlive && player2.isAlive {

                // incrémentation du nombre de tour
                roundNb += 1
                print("Round n°: \(roundNb)")
                
                // "action" function call
                action(teamWhoAttacks: attackingTeam!, teamWhoIsAttacked: attackedTeam!)
                print("fin du round\(roundNb) !")
                
                // swap between characters
                swap(&attackedTeam, &attackingTeam)
            }
            Utils.endOfGame()
            print("\(attackingTeam?.name ?? "" ) is the winner, congratulations !!!")
        }
    }
    
    
    func action(teamWhoAttacks: Player, teamWhoIsAttacked: Player) {
        print("\(teamWhoAttacks.name ?? "") choose the character who will do the action :")
        Utils.theCharacters(team: teamWhoAttacks)
        theOneWhoDoes = teamWhoAttacks.chooseChar(playerchoosed: teamWhoAttacks)
        if let theOneWhoDoes = theOneWhoDoes{
            print("the character who will do the action is \(theOneWhoDoes.name ?? "")")
            print("\(teamWhoAttacks.name ?? "") choose the character who will undergo the action :")
            Utils.theCharacters(team: teamWhoIsAttacked)
            theOneWhoUndergoes = teamWhoAttacks.chooseChar(playerchoosed: teamWhoIsAttacked)
            if let theOneWhoUndergoes = theOneWhoUndergoes {
                
                // is there a random chest ?
                chestPresence = Int.random(in: 0..<10)
                randomChest(theOneWhoDoes: theOneWhoDoes)
                theOneWhoDoes.actionOn(theOneWhoUndergoes: theOneWhoUndergoes)
            }
        }
    }
    
    
    
    // random chest
    func randomChest(theOneWhoDoes: Character) {
        if let chestPresence = chestPresence {
            if chestPresence < 2 {
                let chestDamage = Int.random(in: 0...250)
                print("*************  a chest appears ! ***************")
                print("The weapon it contains causes \(chestDamage) points of damage")
                theOneWhoDoes.weapon.damage = chestDamage
            }
        }
    }
    
    
    
    //  XXXXXXXXXXXXXXXXXXXX  the game  XXXXXXXXXXXXXXXXXXXX
    
    init() {
        Utils.welcomme()
        start()
        round()
    }
}

