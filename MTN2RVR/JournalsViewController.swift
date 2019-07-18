//
//  JournalsViewController.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 7/18/19.
//  Copyright © 2019 Git Swifty. All rights reserved.
//

import UIKit

class JournalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(JournalTableViewCell.self, forCellReuseIdentifier: journalCellIdentifier)
    }
    
    // TableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: journalCellIdentifier, for: indexPath as IndexPath) as? JournalTableViewCell else { return UITableViewCell() }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // IBActions
    
    @IBAction func addJournalButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: addJournalSegueIdentifier, sender: self)
    }

    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Properies
    
    private let addJournalSegueIdentifier = "addJournalSegue"
    private let journalCellIdentifier = "journalCell"
}
