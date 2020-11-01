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
    
    var totalWins = 0
    var totalLosses = 0
    
    //MARK: - metods
    
    func newRound()  {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRamaining: incorrectMovesAllowed)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        updateUI()
    }
    
    func updateUI()  {
        let movesRamaining = currentGame.incorrectMovesRamaining
        let image = "Tree\(movesRamaining < 8 ? movesRamaining : 7)"
        treeImageView.image = UIImage(named: image)
        scoreLabel.text = "Побед: \(totalWins), Проигрышей: \(totalLosses)"
    }
    //MARL: -IB Actions

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

