//
//  Monster.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

struct Monster {
    var name: String
    var image: URL
    var fiction: String?
    var size: Monster.Size
    var type: Monster.TypeMonster
    var source: String
    var alignment: Alignment
    var ac: String
    var hp: Hp
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
    var biom: [Biom]
    var subtype: [String]
    var conditionImmune: String?
    var senses: String?
    var immune: String?
    var resist: String?
    var spells: String?
    
    var trait: [Action]
    var action: [Action]
    var reaction: [Action]
    var legendary: [Action]
    var legendaryInfo: String?
    
    var lair: Location?
    var local: Location?
    
    init(_ monster: MonsterJSON) {
        name = monster.name
        image = monster.image
        fiction = monster.fiction
        size = Size(rawValue: monster.size)!
        type = TypeMonster(rawValue: monster.type)!
        source = monster.source
        alignment = Alignment.getAlignment(for: monster.alignment)
        ac = monster.ac
        hp = Hp(monster.hp)!
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
        biom = monster.biom.map({ Biom(rawValue: $0)! })
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
    
    init(name: String, image: URL, fiction: String?, size: Size, type: TypeMonster!, source: String, alignment: Alignment, ac: String, hp: Hp, speed: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int, save: String?, vulnerable: String?, skill: String?, passive: Int, languages: String?, cr: String, biom: [Biom], subtype: [String], conditionImmune: String?, senses: String?, immune: String?, resist: String?, spells: String?, trait: [Action], action: [Action], reaction: [Action], legendary: [Action], legendaryInfo: String?, lair: Location?, local: Location?) {
        self.name = name
        self.image = image
        self.fiction = fiction
        self.size = size
        self.type = type
        self.source = source
        self.alignment = alignment
        self.ac = ac
        self.hp = hp
        self.speed = speed
        self.str = str
        self.dex = dex
        self.con = con
        self.int = int
        self.wis = wis
        self.cha = cha
        self.save = save
        self.vulnerable = vulnerable
        self.skill = skill
        self.passive = passive
        self.languages = languages
        self.cr = cr
        self.biom = biom
        self.subtype = subtype
        self.conditionImmune = conditionImmune
        self.senses = senses
        self.immune = immune
        self.resist = resist
        self.spells = spells
        
        self.trait = trait
        self.action = action
        self.reaction = reaction
        self.legendary = legendary
        self.legendaryInfo = legendaryInfo
        
        self.lair = lair
        self.local = local
    }
}
