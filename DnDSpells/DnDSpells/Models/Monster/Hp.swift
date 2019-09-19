//
//  Hp.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

struct Hp: CustomStringConvertible {
    
    
    typealias Dice = (dice: UInt, count: UInt)
    
    let defaultValue: UInt
    let dices: Dice
    let bonus: Int
    
    var description: String {
        if bonus >= 0 {
            return "\(defaultValue) (\(dices.dice)к\(dices.count) + \(bonus))"
        } else {
            return "\(defaultValue) (\(dices.dice)к\(dices.count) - \(-bonus))"
        }
    }
    
    func getRandomValue() -> Int {
        var result = bonus
        for _ in 0..<dices.count {
            result += Int.random(in: 1...Int(dices.dice))
        }
        return result
    }
    
    init(_ default: UInt = 0, dices: Dice, bonus: Int = 0) {
        self.defaultValue = `default`
        self.dices = dices
        self.bonus = bonus
    }
    
    init?(_ str: String) {
        var tmpDices = NSRegularExpression.matches(for: "\\(.+\\)", in: str)
        if tmpDices.count != 1 {
            guard let defaultValue = UInt(str) else { return nil }
            self.defaultValue = defaultValue
            self.dices = Dice(dice: 0, count: 0)
            self.bonus = 0
            return
        }
        guard tmpDices.count == 1 else { return nil }
        guard let defaultValue = UInt(str.split(separator: "(")[0].trimmingCharacters(in: CharacterSet.whitespaces)) else { return nil }
        self.defaultValue = defaultValue
        var str2 = tmpDices[0].trimmingCharacters(in: CharacterSet.whitespaces)
        str2.removeFirst()
        str2.removeLast()
        var isNegative = false
        var tmp = str2.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "d", with: "к")
        if tmp.first(where: { $0 == "-"}) != nil {
            tmp = tmp.replacingOccurrences(of: "-", with: "+")
            isNegative = true
        }
        let dicesAndBonus = tmp.split(separator: "+")
        guard dicesAndBonus.count == 2 || dicesAndBonus.count == 1 else { return nil }
        if dicesAndBonus.count == 1 {
            let diceAndCount = dicesAndBonus[0].split(separator: "к")
            guard diceAndCount.count == 2, let dice = UInt(diceAndCount[0]), let count = UInt(diceAndCount[1]) else { return nil }
            self.dices = Dice(dice: dice, count: count)
            self.bonus = 0
        } else {
            let diceAndCount = dicesAndBonus[0].split(separator: "к")
            guard diceAndCount.count == 2, let dice = UInt(diceAndCount[0]), let count = UInt(diceAndCount[1]) else { return nil }
            self.dices = Dice(dice: dice, count: count)
            guard let bonus = Int(dicesAndBonus[1]) else { return nil }
            self.bonus = isNegative ? 0 - bonus : bonus
        }
    }
}
