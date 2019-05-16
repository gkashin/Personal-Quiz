//
//  MainViewController.swift
//  Personal Quiz
//
//  Created by Георгий Кашин on 01/05/2019.
//  Copyright © 2019 Georgii Kashin. All rights reserved.
//

import UIKit

/// Introduction screen
class MainViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var imageViewCollection: [UIImageView]!
}

//MARK: - UIViewController Methods
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup imageViews
        for imageView in imageViewCollection {
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
        }
    }
}

//MARK: - IB Actions
extension MainViewController {
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {}
}


