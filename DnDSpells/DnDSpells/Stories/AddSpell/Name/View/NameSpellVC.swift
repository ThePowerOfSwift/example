//
//  NameSpellVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class NameSpellVC: UIViewController, NameSpellInput {

    // MARK: - NameSpellInput
    var spell: Spell!
    var nameField: FormField! { return nameTextField }
    
    func showNextVC() {
        performSegue(withIdentifier: "school", sender: spell)
    }
    
    private var presenter: NameSpellOutput!
    
    // MARK: - IBOutlet
    @IBOutlet private var nameTextField: TextFieldWithAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NameSpellPresenter(self)
        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SchoolSpellInput, let spell = sender as? Spell else { return }
        vc.spell = spell
    }

    @IBAction func touchNext(_ sender: Any) {
        presenter.touchNextVC()
    }
}
