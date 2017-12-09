//
//  ViewController.swift
//  TableView
//
//  Created by Anhdzai on 12/9/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    func array (number: Int) -> [String] {
        var a = [String]()
        for b in 0...number {
            a.append("\(b)")
        }
        return a
    }
    var arrayString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayString = array(number: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = tableView.indexPathForSelectedRow{
            tableView.reloadRows(at: [index], with: .none)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "number", for: indexPath)
        cell.textLabel?.text = arrayString[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let data = segue.destination as? ViewControllerOne, let index = tableView.indexPathForSelectedRow {
                data.datanumber = arrayString[index.row]
        }
    }
    
    @IBAction func unwindFromAdd(_ sender: UIStoryboardSegue) {
        if let data = sender.source as? ViewControllerOne, let datanumber = data.datanumber {
            if let index = tableView.indexPathForSelectedRow {
                arrayString[index.row] = datanumber
                tableView.reloadRows(at: [index], with: .none)
            } else {
                let indexPath = IndexPath(row: arrayString.count, section: 0)
                arrayString.append(datanumber)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
}

