//
//  Game.swift
//  Apple Pie
//
//  Created by Алексей Пасынков on 01.11.2020.
//

struct Game {
    var word: String
    var incorrectMovesRamaining: Int
    fileprivate var guessedLettered: [Character] = []
    
    init(word:String, incorrectMovesRamaining: Int) {
        self.word = word
        self.incorrectMovesRamaining = incorrectMovesRamaining
    }
    
    var guessedWord: String {
        var wordToShow = ""
        for letter in word {
            if guessedLettered.contains(Character(letter.lowercased())) || letter == "-" || letter == " " {
                wordToShow += String(letter)
            } else {
                wordToShow += "_"
            }
        }
        return wordToShow
    }
    
    mutating func playerGuessed(letter: Character) {
        let lowercaseLetter = Character(letter.lowercased())
        guessedLettered.append(Character(letter.lowercased()))
        if !word.lowercased().contains(lowercaseLetter){
            incorrectMovesRamaining -= 1
        }
    }
}
