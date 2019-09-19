//
//  AddSpellToBookVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import SPStorkController
private let identifier = "cell"
class AddSpellToBookVC: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private var presenter: AddSpellToBookOutput!
    var spell: Spell!
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        presenter.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddSpellToBookPresenter(self, service: SpellService.shared())
        prepareTableView()
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

extension AddSpellToBookVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = presenter.books[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.addSpellToBook(spell, spellBook: presenter.books[indexPath.row])
    }
    
}

extension AddSpellToBookVC: AddSpellToBookInput {
    func close() {
        dismiss(animated: true)
    }
}

extension AddSpellToBookVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        SPStorkController.scrollViewDidScroll(scrollView)
    }
}
