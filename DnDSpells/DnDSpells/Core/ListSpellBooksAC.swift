//
//  ListSpellBooksAC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

private let identifier = "cell"

class ListSpellBooksAC: UIAlertController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var spellbookTableView: UITableView!
    
    private var dataSource: [SpellBook] {
        return Array(SpellService.shared().realm!.objects(SpellBook.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spellbookTableView.dataSource = self
        spellbookTableView.delegate = self
        spellbookTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListSpellBooksAC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].name
        return cell
    }
}
