//
//  FilterInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 22/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol FilterInput {
    var delegate: SpellListInput! { get set }
    var filter: Filter! { get set }
}
