//
//  TableViewController.swift
//  pickAnImage
//
//  Created by Mohsin on 30/01/2018.
//  Copyright © 2018 Mohsin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Mohsin Ghani"
        return cell
    }
    

}
