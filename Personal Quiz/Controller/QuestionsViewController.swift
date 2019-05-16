//
//  QuestionsViewController.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 10/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

import UIKit

/// Question Screen
class QuestionsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var answerLabelCollection: [UILabel]!
    @IBOutlet var answerButtonCollection: [UIButton]!
    @IBOutlet var answerSwitchCollection: [UISwitch]!
    
    @IBOutlet var questionLabelCollection: [UILabel]!
    @IBOutlet var stackViewCollection: [UIStackView]!
    
    @IBOutlet weak var slider: UISlider!

    //MARK: - Stored Properties
    /// List of questions
    var questions = Question.loadData()
    
    /// Index of current question
    var questionIndex = 0
    
    /// Count the number of chosen answers
    var countChosenAnswersTypesDictionary = [BusinessmansName: Int]() 
}

//MARK: - IB Actions
extension QuestionsViewController {
    @IBAction func goButtonPressed(_ sender: UIButton) {
        if questions[questionIndex].type == .ranged {
            let sliderValue = Int(slider.value)
            let answerName = questions[0].answers[sliderValue].name
            countChosenAnswersTypesDictionary[answerName, default: 0] += 1
        } 
        
        nextQuestion()
    }
    
    @IBAction func chooseAnswerButtonPressed(_ sender: UIButton) {
        let index = answerButtonCollection.firstIndex { (button) -> Bool in
            button == sender
        }
        
        let answerName = questions[0].answers[index!].name
        countChosenAnswersTypesDictionary[answerName] = (countChosenAnswersTypesDictionary[answerName] ?? 0) + 1
        
        nextQuestion()
    }
    
    @IBAction func chooseAnswerSwitchPressed(_ sender: UISwitch) {
        let index = answerSwitchCollection.firstIndex { (switchButton) -> Bool in
            switchButton == sender
        }
        
        let answerName = questions[0].answers[index!].name
        
        if sender.isOn {
            countChosenAnswersTypesDictionary[answerName, default: 0] += 1
        } else {
            countChosenAnswersTypesDictionary[answerName, default: 0] -= 1
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let newSliderValue = Float(lroundf(sender.value))
        sender.setValue(newSliderValue, animated: true)
    }
}

//MARK: - UIViewController Methods
extension QuestionsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fill in all the questions
        fillQuestions()
    }
}

//MARK: - Update Questions Information
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
}

//MARK: - Navigation
extension QuestionsViewController {
    func nextQuestion() {
        stackViewCollection[questionIndex].isHidden = true
        questionIndex += 1
        
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        if questionIndex < stackViewCollection.count {
            stackViewCollection[questionIndex].isHidden = false
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        guard let resultViewController = segue.destination as? ResultViewController else { return }
        
        resultViewController.answersDictionary = countChosenAnswersTypesDictionary
    }
}
