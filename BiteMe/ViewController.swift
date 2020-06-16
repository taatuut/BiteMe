//
//  ViewController.swift
//  BiteMe
//
//  Created by Emil Zegers on 16/06/2020.
//  Copyright © 2020 Basalt Aura. All rights reserved.
//

import UIKit
import MongoSwift
import StitchCore

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        
        if stitch.auth.isLoggedIn {
            self.present(UploadViewController(), animated: true)
        } else {
            let alertController = UIAlertController(title: "Login to Stitch", message: "Anonymous Login", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Login", style: .default, handler: { [unowned self] _ -> Void in
                stitch.auth.login(withCredential: AnonymousCredential()) { [weak self] result in
                    switch result {
                    case .failure(let e):
                        fatalError(e.localizedDescription)
                    case .success:
                        DispatchQueue.main.async {
                            self?.present(UploadViewController(), animated: true)
                        }
                    }
                }
            }))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

}
