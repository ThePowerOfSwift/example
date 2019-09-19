//
//  SpellBook.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import RealmSwift

class SpellBook: Object {
    @objc dynamic var name: String = ""
    var spells = List<Spell>()
}
