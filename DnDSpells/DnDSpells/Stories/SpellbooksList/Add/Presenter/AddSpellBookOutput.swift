//
//  AddSpellBookOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import RealmSwift

protocol AddSpellBookOutput: AnyObject {
    func saveSpellBook()
    init(_ view: AddSpellBookInput, service: SpellService)
}
