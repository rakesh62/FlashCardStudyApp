//
//  Flashcard.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import Foundation


class FlashcardStorage {
    static let shared = FlashcardStorage()
    
    private let key = Constants.Flashcard.key
    
    func save(_ flashcards: [Flashcard]) {
        if let data = try? JSONEncoder().encode(flashcards) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load() -> [Flashcard] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let flashcards = try? JSONDecoder().decode([Flashcard].self, from: data) else {
            return []
        }
        return flashcards
    }
}
