//
//  MonsterJSON.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 20/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

struct MonsterJSON: Codable {
    var name: String
    var image: URL
    var fiction: String?
    var size: String
    var type: String
    var source: String
    var alignment: String
    var ac: String
    var hp: String
    var speed: String
    var str: Int
    var dex: Int
    var con: Int
    var int: Int
    var wis: Int
    var cha: Int
    var save: String?
    var vulnerable: String?
    var skill: String?
    var passive: Int
    var languages: String?
    var cr: String
    var biom: [String]
    var subtype: [String]
    var conditionImmune: String?
    var senses: String?
    var immune: String?
    var resist: String?
    var spells: String?
    
    var trait: [Monster.Action]
    var action: [Monster.Action]
    var reaction: [Monster.Action]
    var legendary: [Monster.Action]
    var legendaryInfo: String?
    
    var lair: Monster.Location?
    var local: Monster.Location?
    
    init(_ monster: Monster) {
        name = monster.name
        image = monster.image
        fiction = monster.fiction
        size = monster.size.rawValue
        type = monster.type.rawValue
        source = monster.source
        alignment = monster.alignment.description
        ac = monster.ac
        hp = monster.hp.description
        speed = monster.speed
        str = monster.str
        dex = monster.dex
        con = monster.con
        int = monster.int
        wis = monster.wis
        cha = monster.cha
        save = monster.save
        vulnerable = monster.vulnerable
        skill = monster.skill
        passive = monster.passive
        languages = monster.languages
        cr = monster.cr
        biom = monster.biom.map({ $0.rawValue })
        subtype = monster.subtype
        conditionImmune = monster.conditionImmune
        senses = monster.senses
        immune = monster.immune
        resist = monster.resist
        spells = monster.spells
        
        trait = monster.trait
        action = monster.action
        reaction = monster.reaction
        legendary = monster.legendary
        legendaryInfo = monster.legendaryInfo
        
        lair = monster.lair
        local = monster.local
    }
}
