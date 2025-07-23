//
//  StudySessionViewController.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import UIKit

class StudySessionViewController: UIViewController {
    
    var viewModel: StudySessionViewModel!
    
    @IBOutlet weak var cardContainer: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    private var isAnswerRevealed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.study
        setupTapGesture()
        updateUIWithCurrentCard()
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        cardContainer.addGestureRecognizer(tapGesture)
    }
    
    @objc private func flipCard() {
        guard !isAnswerRevealed else { return }
        
        UIView.transition(with: cardContainer,
                          duration:Constants.Animation.flipDuration,
                          options: .transitionFlipFromRight,
                          animations: {
            self.answerLabel.isHidden = false
        }, completion: { _ in
            self.correctButton.isEnabled = true
            self.wrongButton.isEnabled = true
        })
        
        isAnswerRevealed = true
    }
    
    private func updateUIWithCurrentCard() {
        guard let card = viewModel.currentFlashcard else {
            showCompletionAlert()
            return
        }
        
        questionLabel.text = "\(Constants.Flashcard.question) \(card.question)"
        answerLabel.text = "\(Constants.Flashcard.answer) \(card.answer)"
        answerLabel.isHidden = true
        isAnswerRevealed = false
        
        correctButton.isEnabled = false
        wrongButton.isEnabled = false
    }
    
    @IBAction func correctTapped(_ sender: UIButton) {
        guard isAnswerRevealed else { return } // ✅ extra protection
        viewModel.recordAnswer(correct: true)
        updateUIWithCurrentCard()
    }
    
    @IBAction func wrongTapped(_ sender: UIButton) {
        guard isAnswerRevealed else { return }
        viewModel.recordAnswer(correct: false)
        updateUIWithCurrentCard()
    }
    
    private func showCompletionAlert() {
        let alert = UIAlertController(
            title: Constants.Flashcard.sessionCompleted,
            message: "\(Constants.Flashcard.correct) \(viewModel.correctCount)\n\(Constants.Flashcard.question) \(viewModel.wrongCount)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: Constants.Alert.ok, style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
