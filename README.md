
# 📚 FlashcardStudyApp

A simple iOS app to help users study with flashcards. Features include adding/editing/deleting flashcards, flip animations, and a study mode with local data persistence — all built with **Swift**, **UIKit**, and **MVVM architecture**.

---

## 🚀 Run Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/FlashcardStudyApp.git
   cd FlashcardStudyApp
   ```

2. Open the project in Xcode:
   ```bash
   open FlashCardApp.xcodeproj
   ```

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

---

## 📸 Screenshots (Optional)

<sub>*Add images to your repo and update these links accordingly*</sub>

| Home Screen             | Add Flashcard            | Study Mode               |
|------------------------|--------------------------|--------------------------|
| ![Home](screens/home.png) | ![Add](screens/add.png) | ![Study](screens/study.png) |

---

## 👨‍💻 Author

Rakesh Jadhav  
GitHub: [@your-username](https://github.com/your-username)  
Email: you@example.com

---

## 📄 License

This project is licensed under the MIT License.

---

## ✅ Deliverables Checklist

- [x] iOS App using Swift
- [x] README with:
  - [x] Run Instructions  
  - [x] Architecture explanation  
  - [x] Optional screenshots  
