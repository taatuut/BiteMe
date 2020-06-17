//
//  UploadViewController.swift
//  BiteMe
//
//  Created by Emil Zegers on 16/06/2020.
//  Copyright © 2020 Basalt Aura. All rights reserved.
//

import UIKit
import MongoSwift

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        uploadContact()
    }
    
    func uploadContact() {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let contact = Contact(
            _id: ObjectId(),
            name: "Emil Zegers",
            email: "emil@basaltaura.nl",
            doer: "gewone steekmug",
            doerscientificname: "Culex pipiens",
            notes: "Hinderlijk gezoem",
            doer_pix: "PlatgeslagenMug",
            bite_pix: "RodeZwellingOpLinkerknie",
            doer_location: "52° 9′ NB, 5° 23′ OL",
            doer_date: dateFormatterGet.date(from: "2020-06-18")!
        )
        
        contatcsCollection.insertOne(contact) { (result) in
            switch result {
            case .failure(let e):
                print("error inserting item, \(e.localizedDescription)")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Oops!", message: "Something's wrong", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .success:
                print("successfully inserted a bite")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "BiteMe!", message: "You've just uploaded a bite. Itchy!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

}


