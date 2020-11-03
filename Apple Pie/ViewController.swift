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
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    
    
    //MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    
    var listOfWords1 = [
        "Токио",
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
    
    var listOfWords2 = [
        "Россия",
        "Канада",
        "США",
        "Китай",
        "Бразилия",
        "Австралия",
        "Индия",
        "Аргентина",
        "Казахстан",
        "Судан",
        "Алжир",
        "Конго ",
        "Мексика",
        "Саудовская Аравия",
        "Индонезия",
        "Ливия",
        "Иран",
        "Монголия",
        "Перу",
        "Чад",
        "Нигер",
        "Ангола",
        "Мали",
        "ЮАР  ",
        "Колумбия",
        "Эфиопия",
        "Боливия",
        "Мавритания",
        "Египет",
        "Танзания",
        "Нигерия",
        "Венесуэла",
        "Намибия",
        "Пакистан",
        "Мозамбик",
        "Турция",
        "Чили  ",
        "Замбия",
        "Мьянма",
        "Афганистан",
        "Сомали",
        "Центрально-Африканская Республика",
        "Украина",
        "Ботсвана",
        "Мадагаскар",
        "Кения",
        "Франция",
        "Йемен",
        "Таиланд",
        "Испания",
        "Туркменистан",
        "Камерун",
        "Папуа-Новая Гвинея",
        "Швеция",
        "Узбекистан",
        "Марокко",
        "Ирак",
        "Парагвай",
        "Зимбабве",
        "Япония",
        "Германия",
        "Конго ",
        "Финляндия",
        "Малайзия",
        "Вьетнам",
        "Норвегия",
        "Берег Слоновой Кости  ",
        "Польша",
        "Италия",
        "Филиппины",
        "Эквадор",
        "Буркина-Фасо",
        "Новая Зеландия",
        "Габон",
        "Гвинея",
        "Великобритания",
        "Гана",
        "Румыния",
        "Лаос",
        "Уганда",
        "Гайана",
        "Оман",
        "Беларусь",
        "Киргизия",
        "Сенегал",
        "Сирия",
        "Камбоджа",
        "Уругвай",
        "Тунис",
        "Суринам",
        "Бангладеш",
        "Таджикистан",
        "Непал",
        "Греция",
        "Никарагуа",
        "Эритрея",
        "Северная Корея ",
        "Малави",
        "Бенин",
        "Гондурас",
        "Либерия",
        "Болгария ",
        "Куба",
        "Гватемала",
        "Исландия",
        "Черногория",
        "Южная Корея ",
        "Венгрия",
        "Португалия",
        "Иордания",
        "Азербайджан",
        "Австрия",
    ].shuffled()
    
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
    
    var listOfVariant:[String] = []
    
    
    //MARK: - metods
    func enableButtons(_ enable: Bool = true){
        for button in letterButton{
            button.isEnabled = enable
        }
    }
    
    func newRound()  {
        
        guard !listOfVariant.isEmpty else {
            enableButtons(false)
            updateUI()
            return
        }
        
        let newWord = listOfVariant.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRamaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableButtons(false)
//        newRound()
//        updateUI()
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
    
    @IBAction func cityButton(_ sender: UIButton) {
        if sender.isEnabled {
            listOfVariant = listOfWords1
            newRound()
            updateUI()
        }
    }
    @IBAction func countyButton(_ sender: UIButton) {
        if sender.isEnabled{
            listOfVariant = listOfWords2
            newRound()
            updateUI()
        }
    }
}

