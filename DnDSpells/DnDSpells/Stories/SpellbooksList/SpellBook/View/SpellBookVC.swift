//
//  SpellBookVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 27/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import SPStorkController

class SpellBookVC: UIViewController {

    var presenter: SpellBookOutput!
    var spellBook: SpellBook!
    
    @IBOutlet var spellTableView: UITableView!
    
    fileprivate func prepareTableView() {
        spellTableView.register(UINib(nibName: "SpellCell2", bundle: nil), forCellReuseIdentifier: "cell")
        spellTableView.tableFooterView = UIView()
        spellTableView.dataSource = self
        spellTableView.delegate = self
        spellTableView.separatorColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SpellBookPresenter(self, service: SpellService.shared(), spellBook: spellBook)
        navigationItem.title = spellBook.name
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.reloadData()
    }
}

extension SpellBookVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let level = presenter.dataSource[section][0].level
        if level == 0 {
            return "Заговоры"
        } else {
            return "Заклинания \(level) уровня"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpellCell2
        cell.spell = presenter.dataSource[indexPath.section][indexPath.row]
        cell.index = indexPath
        cell.isHiddenAddButton = true
        cell.delegate = self
        return cell
    }
}

extension SpellBookVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = SpellVC()
        vc.spell = presenter.dataSource[indexPath.section][indexPath.row]
        let transitionDelegate = SPStorkTransitioningDelegate()
        transitionDelegate.hapticMoments = []
        vc.transitioningDelegate = transitionDelegate
        vc.modalPresentationStyle = .custom
        vc.modalPresentationCapturesStatusBarAppearance = true
        self.present(vc, animated: true, completion: nil)
    }
}

extension SpellBookVC: SpellBookInput {
    func updateSpellList() {
        spellTableView.reloadData()
    }
}

extension SpellBookVC: SpellCellTouches {
    func touchSpellCell(_ index: IndexPath) {
        
    }
}
