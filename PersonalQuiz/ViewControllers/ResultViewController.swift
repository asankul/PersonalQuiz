//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    private var animals: [Animal] = []
    private var result: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        getAnimals()
        searchFrequentlyAnswer()
        
        resultLabel.text = "Вы - \(result.rawValue.description)"
        definitionLabel.text = result.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController has been deallocated")
    }
    
    
}

// MARK: - Private Methods
extension ResultViewController {
    private func getAnimals() {
        for animal in answerChosen {
            animals.append(animal.animal)
        }
    }
    
    private func searchFrequentlyAnswer() {
        let groupedAnimals = Dictionary(grouping: animals, by: {$0})
        let countAnswers = groupedAnimals.mapValues({$0.count})
        guard let isResultExist = countAnswers.sorted(by: {$0.value > $1.value}).first?.key else { return }
        result = isResultExist
    }
}

