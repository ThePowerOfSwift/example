//
//  SpellbookVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import RealmSwift

class SpellBookListVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private let cellReuseIdentifier = "cell"
    private var spellService = SpellService.shared()
    private var dataSource: Results<SpellBook>! {
        didSet {
            tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        prepareNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = spellService.realm?.objects(SpellBook.self)
        var userDefault = UserDefaults(suiteName: "group.spell.emp")
        userDefault?.set(Array(dataSource.map({ $0.name })), forKey: "characters")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func touchAddSpellBook() {
        performSegue(withIdentifier: "add", sender: nil)
    }

}

//MARK: - Prepare
extension SpellBookListVC {
    fileprivate func prepareTableView() {
        dataSource = spellService.realm?.objects(SpellBook.self)
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func prepareNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchAddSpellBook))
    }
}

// MARK: - TableView
extension SpellBookListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! BookCell
        cell.layer.cornerRadius = 8
        cell.layer.shadowColor = #colorLiteral(red: 0.4117647059, green: 0.4666666667, blue: 0.537254902, alpha: 1)
        cell.layer.shadowOpacity = 0.05
        cell.layer.shadowOffset = CGSize(width: 0, height: 8)
        cell.layer.shadowRadius = 16
        cell.book = dataSource[indexPath.section]
        return cell
    }
}

extension SpellBookListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let object = dataSource[indexPath.section]
            try? spellService.realm?.write {
                spellService.realm?.delete(object)
            }
            dataSource = spellService.realm?.objects(SpellBook.self)
        default:
            fatalError()
        }
    }
}
