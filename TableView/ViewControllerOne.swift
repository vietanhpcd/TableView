//
//  ViewControllerOne.swift
//  TableView
//
//  Created by Anhdzai on 12/9/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var datanumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = datanumber
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === saveButton  else { return }
        datanumber = textField.text
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let cancel = presentingViewController is UINavigationController
        if cancel {
            dismiss(animated: true, completion: nil)
        } else if let Navigation = navigationController {
            Navigation.popViewController(animated: true)
        } else {
            fatalError("loi")
        }
    }
}
