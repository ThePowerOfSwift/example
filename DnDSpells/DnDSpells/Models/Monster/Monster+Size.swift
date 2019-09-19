//
//  MonsterSize.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

extension Monster {
    enum Size: String, CustomStringConvertible {
        case T
        case S
        case M
        case L
        case H
        case G
        
        var description: String {
            switch self {
            case .T:
                return "Крошечный"
            case .S:
                return "Маленький"
            case .M:
                return "Средний"
            case .L:
                return "Большой"
            case .H:
                return "Огромный"
            case .G:
                return "Колоссальный"
            }
        }
    }
}
