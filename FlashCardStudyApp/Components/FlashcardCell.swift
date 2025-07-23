//
//  FlashcardCell.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import UIKit
class FlashcardCell: UITableViewCell {
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    var onAnswerSelected: ((Bool) -> Void)?

    private var isFlipped = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        frontView.isHidden = false
        backView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(flip))
        self.contentView.addGestureRecognizer(tap)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        frontView.isHidden = false
        backView.isHidden = true
        isFlipped = false
    }
    func configure(with flashcard: Flashcard) {
        questionLabel.text = "\(Constants.Flashcard.question) \(flashcard.question)"
        answerLabel.text = "\(Constants.Flashcard.answer) \(flashcard.answer)"
    }
    
    @objc private func flip() {
        let fromView = isFlipped ? backView! : frontView!
        let toView = isFlipped ? frontView! : backView!
        UIView.transition(from: fromView, to: toView, duration: Constants.Animation.flipDuration, options: [.transitionFlipFromRight, .showHideTransitionViews]) { _ in
            self.isFlipped.toggle()
        }
    }
}
