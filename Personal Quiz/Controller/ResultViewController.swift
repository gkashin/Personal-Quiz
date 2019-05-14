//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 13/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var depiction = String()
    var image = UIImage()
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = depiction
        resultImageView.image = image
    }
}
