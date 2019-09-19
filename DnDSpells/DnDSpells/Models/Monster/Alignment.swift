//
//  Alignment.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

enum Alignment: CustomStringConvertible, Hashable {
    
    case lawfulGood
    case neutralGood
    case chaoticGood
    
    case lawfulNeutral
    case neutral
    case chaoticNeutral
    
    case lawfulEvil
    case neutralEvil
    case chaoticEvil
    
    case other(desc: String)
    
    var description: String {
        switch self {
        case .lawfulGood:
            return "законно-доброе"
        case .neutralGood:
            return "нейтрально-доброе"
        case .chaoticGood:
            return "хаотично-доброе"
        case .lawfulNeutral:
            return "законно-нейтральное"
        case .neutral:
            return "нейтральное"
        case .chaoticNeutral:
            return "хаотично-нейтральное"
        case .lawfulEvil:
            return "законно-злое"
        case .neutralEvil:
            return "нейтрально-злое"
        case .chaoticEvil:
            return "хаотично-злое"
        case .other(let desc):
            return desc
        }
    }
    
    static func getAlignment(for alignment: String) -> Alignment {
        switch alignment {
        case "законно-доброе":
            return .lawfulGood
        case "нейтрально-доброе":
            return .neutralGood
        case "хаотично-доброе":
            return .chaoticGood
        case "законно-нейтральное":
            return .lawfulNeutral
        case "нейтральное":
            return .neutral
        case "хаотично-нейтральное":
            return .chaoticNeutral
        case "законно-злое":
            return .lawfulEvil
        case "нейтрально-злое":
            return .neutralEvil
        case "хаотично-злое":
            return .chaoticEvil
        default:
            return .other(desc: alignment)
        }
    }
}
