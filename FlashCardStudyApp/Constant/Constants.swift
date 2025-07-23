//
//  Constant.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 23/07/25.
//

import Foundation
enum Constants {
    
    enum Alert {
        static let addTitle = "Add Flashcard"
        static let editTitle = "Edit Flashcard"
        static let errorTitle = "Error"
        static let errorEmptyFields = "Both fields must be filled."
        static let errorNoFlashcards = "Please add at least one flashcard before starting the session."
        static let ok = "OK"
        static let cancel = "Cancel"
        static let add = "Add"
        static let save = "Save"
        static let noFlashCard = "No Flashcards"

    }
    
    enum Flashcard {
        static let questionPlaceholder = "Enter question"
        static let answerPlaceholder = "Enter answer"
        static let sessionCompleted = "Session Completed"
        static let question = "Question:"
        static let answer = "Answer:"
        static let correct = "Correct:"
        static let wrong = "Wrong:"
        static let key = "flashcards"
    }
    
    enum ReuseIdentifier {
        static let flashcardCell = "FlashcardCell"
    }
    
    enum ViewController {
        static let studySessionVC = "StudySessionViewController"
    }
    
    enum DefaultsKeys {
        static let savedFlashcards = "savedFlashcards"
    }
    
    enum Animation {
        static let flipDuration = 0.5
    }
    enum NavigationTitle {
        static let flashcards = "Flashcards"
        static let study = "Study"

    }
    enum ButtonTitle {
        static let studySession = "Start Study Session"
        static let delete = "Delete"
        static let edit = "Edit"

    }
}
