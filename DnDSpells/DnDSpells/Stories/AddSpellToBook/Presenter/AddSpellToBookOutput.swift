//
//  AddSpellToBookOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol AddSpellToBookOutput {
    var books: [SpellBook] { get }
    
    func reloadData()
    func addSpellToBook(_ spell: Spell, spellBook: SpellBook)
    init(_ view: AddSpellToBookInput, service: SpellService)
}
