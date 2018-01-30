//
//  TableViewController.swift
//  pickAnImage
//
//  Created by Mohsin on 30/01/2018.
//  Copyright © 2018 Mohsin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var memes = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.memes = appDelegate.memes
        tableView.reloadData()
        print("memes count = \(self.memes.count)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        cell.memeText?.text = "My New Meme Here"
        cell.memeImageView.image = memes[indexPath.row]
        return cell;
        // let cell = UITableViewCell()
        // cell.textLabel?.text = "Mohsin Ghani"
        // return cell
    }

    

}
