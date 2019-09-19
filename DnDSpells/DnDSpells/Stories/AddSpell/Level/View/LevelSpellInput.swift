//
//  LevelSpellInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

protocol LevelSpellInput: AnyObject {
    var selectedRow: Int { get }
    
    func showNextVC()
}
