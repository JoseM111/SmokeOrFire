//
//  UIViewControllerExtension.swift
//  SmokeOrFire
//
//  Created by Junior Suarez-Leyva on 5/20/20.
//  Copyright © 2020 Jose Martinez. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
