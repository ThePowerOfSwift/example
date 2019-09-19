//
//  SpellBookOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 27/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol SpellBookOutput {
    
    var spellBook: SpellBook { get set }
    var dataSource: [[Spell]] { get }
    
    func reloadData()
    
    init(_ view: SpellBookInput, service: SpellService, spellBook: SpellBook)
}
