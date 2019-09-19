//
//  NameSpellInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol NameSpellInput: AnyObject {
    var spell: Spell! { get set }
    var nameField: FormField! { get }
    
    func showNextVC()
}
