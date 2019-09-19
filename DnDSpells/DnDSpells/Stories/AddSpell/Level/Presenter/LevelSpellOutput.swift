//
//  LevelSpellOutput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol LevelSpellOutput: AnyObject {

    var spell: Spell! { get }
    var dataSource: [String] { get }
    
    func touchNextVC()
}
