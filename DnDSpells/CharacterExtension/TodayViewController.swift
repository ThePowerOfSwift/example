//
//  TodayViewController.swift
//  CharacterExtension
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var characterTableView: UITableView!
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        characterTableView.delegate = self
        characterTableView.dataSource = self
        // Do any additional setup after loading the view from its nib.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        let shared = UserDefaults.init(suiteName:  "group.spell.emp")
        if let characters = shared?.array(forKey: "characters") as? [String] {
            dataSource = characters
            characterTableView.reloadData()
        }
        completionHandler(NCUpdateResult.newData)
    }
}

extension TodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}

extension TodayViewController: UITableViewDelegate {
    
}
