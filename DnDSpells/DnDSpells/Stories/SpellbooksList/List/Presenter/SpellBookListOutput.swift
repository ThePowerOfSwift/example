//
//  SpellBookListOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 27/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol SpellBookListOutput {
    var spellBooks: [SpellBook] { get }
    
    func delete(_ index: IndexPath)
    func reloadData()
    
    init(_ view: SpellBookListInput, service: SpellService)
}
