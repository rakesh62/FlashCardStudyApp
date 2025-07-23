//
//  FlashcardListViewModel.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import Foundation

class FlashcardListViewModel {
    private(set) var flashcards: [Flashcard] = []
    
    init() {
        loadFlashcards()
    }
    
    func numberOfItems() -> Int {
        flashcards.count
    }
    
    func flashcard(at index: Int) -> Flashcard {
        flashcards[index]
    }
    
    func add(flashcard: Flashcard) {
        flashcards.append(flashcard)
        saveFlashcards()
    }
    
    func update(at index: Int, with flashcard: Flashcard) {
        guard flashcards.indices.contains(index) else { return }
        flashcards[index] = flashcard
        saveFlashcards()
    }
    
    func delete(at index: Int) {
        guard flashcards.indices.contains(index) else { return }
        flashcards.remove(at: index)
        saveFlashcards()
    }
    
    // MARK: - Persistence
    func saveFlashcards() {
        FlashcardStorage.shared.save(flashcards)
    }
    
    func loadFlashcards() {
        flashcards = FlashcardStorage.shared.load()
    }
}
