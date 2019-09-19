//
//  SpellListVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 18/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import RealmSwift
import SPStorkController

class SpellListVC: UIViewController {

    @IBOutlet private var spellsTableView: UITableView!
    
    private var presenter: SpellListOutput!
    private var searchController: UISearchController!
    private var pickerIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SpellListPresenter(self, service: SpellService.shared())
        definesPresentationContext = true
        prepareSearchController()
        prepareNavigationItem()
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.reloadData(nil)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var vc = segue.destination as? FilterInput, let filter = sender as? Filter {
            vc.delegate = self
            vc.filter = filter
        }
    }
    
    @IBAction func touchFilter() {
        performSegue(withIdentifier: "filter", sender: presenter.filter)
    }
}

extension SpellListVC: UITableViewDataSource {
    
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
        cell.delegate = self
        return cell
    }
}

extension SpellListVC: UITableViewDelegate {
    
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

extension SpellListVC {
    fileprivate func prepareSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Название заклинания"
        searchController.searchBar.scopeButtonTitles = ["Русский", "English"]
    }
    
    fileprivate func prepareNavigationItem() {
        navigationItem.title = "Заклинания"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(touchFilter))
    }
    
    fileprivate func prepareTableView() {
        spellsTableView.register(UINib(nibName: "SpellCell2", bundle: nil), forCellReuseIdentifier: "cell")
        spellsTableView.tableFooterView = UIView()
        spellsTableView.dataSource = self
        spellsTableView.delegate = self
        spellsTableView.separatorColor = .clear
    }
}

extension SpellListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.reloadData(nil)
    }
}

extension SpellListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        presenter.changeLanguage(selectedScope)
    }
}

extension SpellListVC: SpellListInput {
    var query: String? {
        return searchController.searchBar.text
    }
    
    func updateSpellList() {
        spellsTableView.reloadData()
    }
    
    func setFilter(_ filter: Filter) {
        presenter.reloadData(filter)
    }
}

extension SpellListVC: SpellCellTouches {
    func touchSpellCell(_ index: IndexPath) {
        let vc = AddSpellToBookVC()
        vc.spell = presenter.dataSource[index.section][index.row]
        let transitionDelegate = SPStorkTransitioningDelegate()
        transitionDelegate.hapticMoments = []
        transitionDelegate.showCloseButton = true
        transitionDelegate.customHeight = 300
        vc.transitioningDelegate = transitionDelegate
        vc.modalPresentationStyle = .custom
        vc.modalPresentationCapturesStatusBarAppearance = true
        
        self.present(vc, animated: true, completion: nil)
    }
}
