//
//  NameSpellPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 18/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

class NameSpellPresenter: NameSpellOutput {
    weak var view: NameSpellInput!
    var spell: Spell!
    
    func touchNextVC() {
        if view.nameField.validation(true) {
            view.showNextVC()
        }
    }
    
    init(_ view: NameSpellInput) {
        self.view = view
        view.nameField.customValidation = [Validation.isNotEmpty]
    }
}
