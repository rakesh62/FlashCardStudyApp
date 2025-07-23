
# 📚 FlashcardStudyApp

A simple iOS app to help users study with flashcards. Features include adding/editing/deleting flashcards, flip animations, and a study mode with local data persistence — all built with **Swift**, **UIKit**, and **MVVM architecture**.

---

## 🚀 Run Instructions

1. Clone the repository:
2. Open the project in Xcode:
3. Build & run the project on a simulator or a real device using:
   - Xcode 14.0+ (or compatible)
   - iOS 13.0+ target

---

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture:

- **Model**
  - `Flashcard`: A simple struct containing question and answer.
  - `FlashcardStorage`: Handles persistence via `UserDefaults`.

- **View**
  - `FlashcardTableViewCell`: Shows question/answer with flip animation.
  - `StudySessionViewController`: UI for study mode with swiping and tracking correct/incorrect answers.

- **ViewModel**
  - `FlashcardListViewModel`: Manages list operations (add, update, delete, fetch).
  - `StudySessionViewModel`: Manages study session logic like tracking progress and shuffling.

This clean separation improves testability and reusability.

---

## 🎯 Features

- Add, Edit, Delete flashcards using alert controllers.
- Beautiful **flip animation** to toggle question/answer.
- Local persistence using `UserDefaults`.
- Study mode with navigation, shuffle, and answer tracking.
- Responsive UI with proper reuse handling (`prepareForReuse` implemented).

## 👨‍💻 Author

Rakesh Jadhav  
GitHub: [@rakesh62](https://github.com/rakesh62)  
Email: jadhavrakesh6@gmail.com

---

## ✅ Deliverables Checklist

- [x] iOS App using Swift
- [x] README with:
  - [x] Run Instructions  
  - [x] Architecture explanation  
