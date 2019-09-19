//
//  LevelSpellVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 13/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class LevelSpellVC: UIViewController {
    
    private var presenter: LevelSpellOutput!
    @IBOutlet var levelPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        levelPickerView.dataSource = self
        levelPickerView.delegate = self
        presenter = LevelSpellPresenter(self)
    }


    @IBAction func touchNext(_ sender: Any) {
        presenter.touchNextVC()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? NameSpellInput, let spell = sender as? Spell else { return }
        vc.spell = spell
    }

}

// MARK: - UIPickerViewDataSource
extension LevelSpellVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.dataSource.count
    }
}

// MARK: - UIPickerViewDelegate
extension LevelSpellVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.dataSource[row]
    }
}

// MARK: - LevelSpellInput
extension LevelSpellVC: LevelSpellInput {
    var selectedRow: Int { return levelPickerView.selectedRow(inComponent: 0) }
    
    func showNextVC() {
        performSegue(withIdentifier: "name", sender: presenter.spell)
    }
}
