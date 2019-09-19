//
//  Biom.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

enum Biom: String, CustomStringConvertible {
    case arctic = "ARCTIC"
    case coastal = "COASTAL"
    case desert = "DESERT"
    case forest = "FOREST"
    case grassland = "GRASSLAND"
    case hill = "HILL"
    case mountain = "MOUNTAIN"
    case swamp = "SWAMP"
    case underdark = "UNDERDARK"
    case urban = "URBAN"
    
    var description: String {
        switch self {
        case .arctic:
            return "Заполярье"
        case .coastal:
            return "Побережье"
        case .desert:
            return "Пустыня"
        case .forest:
            return "Лес"
        case .grassland:
            return "Равнина"
        case .hill:
            return "Холмы"
        case .mountain:
            return "Горы"
        case .swamp:
            return "Болота"
        case .underdark:
            return "Подземье"
        case .urban:
            return "Город"
        }
    }
}
