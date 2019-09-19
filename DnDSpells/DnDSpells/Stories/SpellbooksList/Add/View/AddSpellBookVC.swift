//
//  AddSpellBookVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class AddSpellBookVC: UIViewController {

    @IBOutlet private var nameTextField: TextFieldWithAnimation!
    private var spellService = SpellService.shared()
    private var presenter: AddSpellBookOutput!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddSpellBookPresenter(self, service: SpellService.shared())
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = nameTextField.becomeFirstResponder()
    }

    @IBAction func touchSaveSpellBook(_ sender: Any) {
        presenter.saveSpellBook()
    }
}

extension AddSpellBookVC: AddSpellBookInput {
    
    var nameSpellBook: FormField! {
        return nameTextField
    }
    
    func successCreate() {
        navigationController?.popViewController(animated: true)
    }
}
