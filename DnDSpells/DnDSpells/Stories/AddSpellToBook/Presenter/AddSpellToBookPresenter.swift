//
//  AddSpellToBookPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

class AddSpellToBookPresenter: AddSpellToBookOutput {
    private weak var view: AddSpellToBookInput!
    private var service: SpellService!
    var books: [SpellBook]
    
    func reloadData() {
        books = Array(service.realm!.objects(SpellBook.self))
    }
    
    func addSpellToBook(_ spell: Spell, spellBook: SpellBook) {
        try! service.realm!.write {
            spellBook.spells.append(spell)
        }
        view.close()
    }
    
    required init(_ view: AddSpellToBookInput, service: SpellService) {
        self.view = view
        self.service = service
        self.books = []
    }
}
