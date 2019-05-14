//
//  QuestionsViewController.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 10/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var questions = Question.loadData()
    var questionNumber = 0
    var answersTypesDictionary: [String: Int] = ["Steve Jobs": 0, "Elon Mask": 0, "Bill Gates": 0, "Jeff Bezos": 0]
    
    @IBOutlet var answerLabelCollection: [UILabel]!
    @IBOutlet var questionLabelCollection: [UILabel]!
    @IBOutlet var stackViewCollection: [UIStackView]!
    @IBOutlet var answerButtonCollection: [UIButton]!
    @IBOutlet var answerSwitchCollection: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        if questions[questionNumber].type == .ranged {
            let sliderValue = Int(slider.value)
            let answerName = questions[0].answers[sliderValue].name
            answersTypesDictionary["\(answerName.rawValue)"]! += 1
        }
        nextQuestion()
    }
    
    @IBAction func chooseAnswerButtonPressed(_ sender: UIButton) {
        let index = answerButtonCollection.firstIndex { (button) -> Bool in
            button == sender
        }
        
        let answerName = questions[0].answers[index!].name
        answersTypesDictionary["\(answerName.rawValue)"]! += 1
        
        nextQuestion()
    }
    
    @IBAction func chooseAnswerSwitchPressed(_ sender: UISwitch) {
        let index = answerSwitchCollection.firstIndex { (switchButton) -> Bool in
            switchButton == sender
        }
        
        let answerName = questions[0].answers[index!].name
        
        if sender.isOn {
            answersTypesDictionary["\(answerName.rawValue)"]! += 1
        } else {
            answersTypesDictionary["\(answerName.rawValue)"]! -= 1
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let newSliderValue = Float(lroundf(sender.value))
        sender.setValue(newSliderValue, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillQuestions()
    }
}

extension QuestionsViewController {
    
    private func fillQuestions() {
        var counterLabelAnswers = 0
        
        for (indexQuestion, question) in questions.enumerated() {
            questionLabelCollection[indexQuestion].text = question.text
            
            switch question.type {
            case .single:
                for (index, answer) in question.answers.enumerated() {
                    answerButtonCollection[index].setTitle(answer.text, for: .normal)
                }
            case .multiple, .ranged:
                for answer in question.answers {
                    answerLabelCollection[counterLabelAnswers].text = answer.text
                    counterLabelAnswers += 1
                }
            }
        }
    }
    
    private func nextQuestion() {
        stackViewCollection[questionNumber].isHidden = true
        questionNumber += 1
        
        title = "Вопрос №\(questionNumber + 1) из \(questions.count)"
        
        if questionNumber < stackViewCollection.count {
            stackViewCollection[questionNumber].isHidden = false
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultViewController = segue.destination as? ResultViewController else { return }
        
        let maxValue = answersTypesDictionary.values.max()
        let maxValuePair = answersTypesDictionary.first { (pair) -> Bool in
            pair.value == maxValue
        }
        let maxValueName = maxValuePair?.key
        let maxValueCase = BusinessmansName(rawValue: maxValueName!)!
        
        resultViewController.depiction = maxValueCase.description
        resultViewController.image = UIImage(named: maxValueName!)!
        resultViewController.title = "Вы \(maxValueName!)!"
    }
}
