//
//  SpellBookPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 27/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

class SpellBookPresenter: SpellBookOutput {
    
    private weak var view: SpellBookInput!
    private let service: SpellService
    
    var spellBook: SpellBook
    var dataSource: [[Spell]]
    
    func reloadData() {
        let sortResult = spellBook.spells.sorted { (lv, rv) -> Bool in
            if lv.level < rv.level { return true }
            if lv.level == rv.level && lv.name < rv.name { return true }
            return false
        }
        dataSource = []
        guard sortResult.count > 0 else {
            view.updateSpellList()
            return
        }
        dataSource.append([])
        var currentIndex = 0
        var currentLevel = sortResult.first!.level
        sortResult.forEach { item in
            if item.level == currentLevel {
                dataSource[currentIndex].append(item)
            } else {
                dataSource.append([item])
                currentLevel = item.level
                currentIndex += 1
            }
        }
        view.updateSpellList()
    }
    
    
    
    
    required init(_ view: SpellBookInput, service: SpellService, spellBook: SpellBook) {
        self.view = view
        self.service = service
        self.dataSource = []
        self.spellBook = spellBook
    }
}
