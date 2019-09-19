//
//  SpellBookListPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 27/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

class SpellBookListPresenter: SpellBookListOutput {
    var spellBooks: [SpellBook]
    
    private weak var view: SpellBookListInput!
    private let service: SpellService
    
    func delete(_ index: IndexPath) {
        let object = spellBooks[index.section]
        try? service.realm!.write {
            service.realm!.delete(object)
        }
        reloadData()
    }
    
    func reloadData() {
        spellBooks = Array(service.realm!.objects(SpellBook.self))
        let userDefault = UserDefaults(suiteName: "group.spell.emp")
        userDefault?.set(Array(spellBooks.map({ $0.name })), forKey: "characters")
        view.updateSpellBookList()
    }
    
    required init(_ view: SpellBookListInput, service: SpellService) {
        self.view = view
        self.service = service
        self.spellBooks = []
    }
}
