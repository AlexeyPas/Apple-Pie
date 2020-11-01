//
//  ViewController.swift
//  Apple Pie
//
//  Created by Алексей Пасынков on 29.10.2020.
//

import UIKit

class ViewController: UIViewController {

// MARK: -IB Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButton: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    
    var listOfWords = [
        "Токио",
        "Япония",
        "Дели",
        "Шанхай",
        "Сан-Паулу",
        "Мехико",
        "Каир",
        "Мумбаи",
        "Пекин",
        "Дакка",
        "Осака",
        "Нью-Йорк",
        "Карачи",
        "Буэнос-Айрес",
        "Чунцин",
        "Стамбул",
        "Калькутта",
        "Манила",
        "Лагос",
        "Рио-де-Жанейро",
        "Тяньцзинь",
        "Киншаса",
        "Гуанчжоу",
        "Лос-Анджелес",
        "Москва",
        "Шэньчжэнь",
        "Лахор",
        "Бангалор",
        "Париж",
        "Богота",
        "Джакарта",
        "Ченнай",
        "Лима",
        "Бангкок",
        "Сеул",
        "Нагоя",
        "Хайдарабад",
        "Лондон",
        "Тегеран",
        "Чикаго",
        "Чэнду",
        "Нанкин",
        "Ухань",
        "Хошимин",
        "Луанда",
        "Ахмедабад",
        "Куала Лумпур",
        "Сиань",
        "Гонконг",
        "Дунгуань",
        "Ханчжоу",
        "Фошань",
        "Шэньян",
        "Эр-Рияд",
        "Багдад",
        "Сантьяго",
        "Сурат",
        "Мадрид",
        "Сучжоу",
        "Пуна",
        "Харбин",
        "Хьюстон",
        "Даллас",
        "Торонто",
        "Дар-эс-Салам",
        "Майами",
        "Белу-Оризонти",
        "Сингапур",
        "Филадельфия",
        "Атланта",
        "Фукуока",
        "Хартум",
        "Барселона",
        "Йоханнесбург",
        "Санкт-Петербург",
        "Циндао",
        "Далянь",
        "Вашингтон",
        "Янгон",
        "Александрия",
        "Цзинань",
        "Гвадалахара",
                    
    ]
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    //MARK: - metods
    func enableButtons(_ enable: Bool = true){
        for button in letterButton{
            button.isEnabled = enable
        }
    }
    
    func newRound()  {
        guard !listOfWords.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRamaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        updateUI()
    }
    
    func updateCorrectWordLabel()  {
        var displayWord = [String]()
        for letter in currentGame.guessedWord{
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState(){
        if currentGame.incorrectMovesRamaining < 1 {
            totalLosses += 1
        }else if currentGame.guessedWord == currentGame.word{
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
    func updateUI()  {
        let movesRamaining = currentGame.incorrectMovesRamaining
        let numberInage = (movesRamaining + 64) % 8
        let image = "Tree\(numberInage)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Побед: \(totalWins), Проигрышей: \(totalLosses)"
        
    }
    //MARL: -IB Actions

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
    
}

