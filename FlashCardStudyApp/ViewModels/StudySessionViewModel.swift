//
//  StudySessionViewModel.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import Foundation

class StudySessionViewModel {
    private var flashcards: [Flashcard]
    private(set) var currentIndex = 0
    private(set) var correctCount = 0
    private(set) var wrongCount = 0
    
    init(flashcards: [Flashcard]) {
        self.flashcards = flashcards.shuffled()
    }
    
    var currentFlashcard: Flashcard? {
        guard currentIndex < flashcards.count else { return nil }
        return flashcards[currentIndex]
    }
    
    var isFinished: Bool {
        currentIndex >= flashcards.count
    }
    
    func recordAnswer(correct: Bool) {
        if correct {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        currentIndex += 1
    }
    
    func resetSession() {
        currentIndex = 0
        correctCount = 0
        wrongCount = 0
    }
    
    var totalCount: Int {
        flashcards.count
    }
}
