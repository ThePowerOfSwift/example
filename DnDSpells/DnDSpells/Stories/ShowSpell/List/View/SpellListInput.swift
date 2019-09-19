//
//  SpellListInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 22/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol SpellListInput: AnyObject {
    var query: String? { get }
    
    func updateSpellList()
    func setFilter(_ filter: Filter)
}
