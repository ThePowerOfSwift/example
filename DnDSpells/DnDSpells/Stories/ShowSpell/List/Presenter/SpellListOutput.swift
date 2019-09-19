//
//  ListSpellOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol SpellListOutput {
    
    var dataSource: [[Spell]] { get }
    var books: Array<SpellBook> { get }
    var filter: Filter { get }
    
    func changeLanguage(_ selectedScope: Int)
    func reloadData(_ filter: Filter?)
    func add(_ spell: Spell, to book: SpellBook)
    
    init(_ view: SpellListInput, service: SpellService)
}
