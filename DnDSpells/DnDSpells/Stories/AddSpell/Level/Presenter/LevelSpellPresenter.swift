//
//  LevelSpellPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class LevelSpellPresenter: LevelSpellOutput {
    weak var view: LevelSpellInput!
    
    var spell: Spell!
    var dataSource: [String] = ["Кантрип", "1 круг", "2 круг", "3 круг", "4 круг", "5 круг", "6 круг", "7 круг", "8 круг", "9 круг"]
    
    func touchNextVC() {
        spell.level = view.selectedRow
        view.showNextVC()
    }
    
    init(_ view: LevelSpellInput) {
        self.view = view
        spell = Spell()
    }
}
