//
//  SchoolSpellInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol SchoolSpellInput: AnyObject {
    var spell: Spell! { get set }
}
