//
//  FlashcardListViewController.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 21/07/25.
//

import UIKit

class FlashcardListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = FlashcardListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupStudyButtonFooter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadFlashcards()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "FlashcardCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FlashcardCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    private func setupNavigationBar() {
        title = "Flashcards"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTapped))
    }
    
    private func setupStudyButtonFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 80))
        
        let button = UIButton(type: .system)
        button.setTitle("Start Study Session", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startStudySession), for: .touchUpInside)
        
        footerView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        tableView.tableFooterView = footerView
    }
    
    
    func showEditAlert(for index: Int) {
        let flashcard = viewModel.flashcards[index]
        showTextInputAlert(
            title: "Edit Flashcard",
            placeholders: ["Enter question", "Enter answer"],
            prefilled: [flashcard.question, flashcard.answer],
            confirmTitle: "Save"
        ) { [weak self] inputs in
            guard let self = self else { return }
            guard inputs.count == 2, !inputs[0].isEmpty, !inputs[1].isEmpty else {
                self.showSimpleAlert(title: "Error", message: "Both fields must be filled.")
                return
            }
            
            let updatedFlashcard = Flashcard(question: inputs[0], answer: inputs[1])
            self.viewModel.update(at: index, with: updatedFlashcard)
            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
    
    @objc private func addTapped() {
        showTextInputAlert(
            title: "Add Flashcard",
            placeholders: ["Enter question", "Enter answer"]
        ) { [weak self] inputs in
            guard let self = self else { return }
            guard inputs.count == 2, !inputs[0].isEmpty, !inputs[1].isEmpty else {
                self.showSimpleAlert(title: "Error", message: "Both question and answer are required.")
                return
            }
            
            let flashcard = Flashcard(question: inputs[0], answer: inputs[1])
            self.viewModel.add(flashcard: flashcard)
            self.tableView.reloadData()
        }
    }

    @objc private func startStudySession() {
        guard !viewModel.flashcards.isEmpty else {
            showSimpleAlert(
                title: "No Flashcards",
                message: "Please add at least one flashcard before starting the session."
            )
            return
        }
        
        let sessionVC = storyboard?.instantiateViewController(withIdentifier: "StudySessionViewController") as! StudySessionViewController
        sessionVC.viewModel = StudySessionViewModel(flashcards: viewModel.flashcards)
        navigationController?.pushViewController(sessionVC, animated: true)
    }
    
}

extension FlashcardListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlashcardCell", for: indexPath) as? FlashcardCell else {
            return UITableViewCell()
        }
        
        let flashcard = viewModel.flashcard(at: indexPath.row)
        cell.configure(with: flashcard)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    // Swipe actions
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.viewModel.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            self.showEditAlert(for: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
