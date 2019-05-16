//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 13/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!

    //MARK: - Stored Properties
    var answersDictionary = [BusinessmansName: Int]()
}

//MARK: - UIViewController Methods
extension ResultViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResult()
    }
}

//MARK: - Update User Interface
extension ResultViewController {
    func updateResult() {
        let sortedAnswersDictionary = answersDictionary.sorted { $0.value > $1.value }
        guard let mostFrequentAnswer = sortedAnswersDictionary.first?.key else { return }
        
        updateUI(with: mostFrequentAnswer)
    }
    
    /// Update User Interface
    ///
    /// - Parameter businessmanName: BusinessmansName - enumeration of businessman's names
    func updateUI(with businessmanName: BusinessmansName) {
        let image = UIImage(named: businessmanName.rawValue)
        
        title = "Вы \(businessmanName.rawValue)!"
        resultImageView.image = image
        descriptionLabel.text = businessmanName.description
    }
}
