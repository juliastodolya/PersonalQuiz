//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Юлия on 02.06.2020.
//  Copyright © 2020 Julia Stodolya. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet var resultEmodjiLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    
    //MARK: - Public properties
    var answersChoosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultEmodjiLabel.text = "Вы - \(answersSort(for: answersChoosen).rawValue)!"
        resultDefinitionLabel.text = "\(answersSort(for: answersChoosen).definition)"
        navigationItem.hidesBackButton = true
    }
    
    
    
    // MARK: - Private methods
    private func answersSort(for answers: [Answer]) -> AnimalType {
        var dogCount = 0
        var catCount = 0
        var turtleCount = 0
        var rabbitCount = 0
        
        for answer in answers {
            switch answer.type {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .turtle:
                turtleCount += 1
            case .rabbit:
                rabbitCount += 1
            }
        }
        var numAnimals = [dogCount, catCount, turtleCount, rabbitCount]
        numAnimals = numAnimals.sorted()
        let numWinner = numAnimals.last
        
        if numWinner == dogCount {
            return .dog
        } else if numWinner == catCount {
            return .cat
        } else if numWinner == turtleCount {
            return .turtle
        } else {
            return .rabbit
        }
    }
        
}


