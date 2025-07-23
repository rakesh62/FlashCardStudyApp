//
//  UIViewController+Extension.swift
//  FlashCardStudyApp
//
//  Created by Rakesh.Jadhav02 on 23/07/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showTextInputAlert(
        title: String,
        message: String? = nil,
        placeholders: [String],
        prefilled: [String] = [],
        confirmTitle: String = "OK",
        cancelTitle: String = "Cancel",
        onConfirm: @escaping (_ inputs: [String]) -> Void
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (i, placeholder) in placeholders.enumerated() {
            alert.addTextField { textField in
                textField.placeholder = placeholder
                if i < prefilled.count {
                    textField.text = prefilled[i]
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { _ in
            let texts = alert.textFields?.compactMap { $0.text?.trimmingCharacters(in: .whitespacesAndNewlines) } ?? []
            onConfirm(texts)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true)
    }
    
    func showSimpleAlert(title: String, message: String?, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        present(alert, animated: true)
    }
}
