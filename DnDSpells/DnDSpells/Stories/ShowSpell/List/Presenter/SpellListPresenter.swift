//
//  ListSpellPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 26/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//
import Foundation
import RealmSwift

class SpellListPresenter: SpellListOutput {
    
    // MARK: - Properties
    weak var view: SpellListInput!
    var filter: Filter
    let service: SpellService
    var dataSource: [[Spell]]
    var books: Array<SpellBook> {
        return Array(service.realm!.objects(SpellBook.self))
    }
    
    // MARK: - Search options
    var language: String = "ru"
    var languagePredication: NSPredicate {
        return NSPredicate(format: "language == %@", language)
    }
    var filterLevelPredication: NSPredicate? {
        guard filter.levels.count > 0 else { return nil }
        return NSPredicate(format: "level IN %@", filter.levels)
    }
    var filterProfessionPredication: NSPredicate? {
        guard filter.profession.count > 0 else { return nil }
        return NSPredicate(format: "ANY professions IN %@", filter.profession)
    }
    
    // MARK: - Method
    func reloadData(_ filter: Filter?) {
        if filter != nil {
            self.filter = filter!
        }
        searchSpells()
    }
    
    func changeLanguage(_ selectedScope: Int) {
        language = selectedScope == 0 ? "ru" : "en"
        searchSpells()
        view.updateSpellList()
    }
    
    private func searchSpells() {
        var tmpResult = service.getAllSpell()
            .filter(languagePredication)
            .filter("nameQuery LIKE[c] '*\((view.query ?? "").lowercased())*'")
        if let level = filterLevelPredication {
            tmpResult = tmpResult.filter(level)
        }
        if let prof = filterProfessionPredication {
            tmpResult = tmpResult.filter(prof)
        }
        if filter.isConcentration {
            tmpResult = tmpResult.filter(NSPredicate(format: "isConcentration == true"))
        }
        if filter.isRitual {
            tmpResult = tmpResult.filter(NSPredicate(format: "isRitual == true"))
        }
        let sortResult = tmpResult.sorted { (lv, rv) -> Bool in
            if lv.level < rv.level { return true }
            if lv.level == rv.level && lv.name < rv.name { return true }
            return false
        }
        dataSource = []
        guard sortResult.count > 0 else {
            view.updateSpellList()
            return
        }
        dataSource.append([])
        var currentIndex = 0
        var currentLevel = sortResult.first!.level
        sortResult.forEach { item in
            if item.level == currentLevel {
                dataSource[currentIndex].append(item)
            } else {
                dataSource.append([item])
                currentLevel = item.level
                currentIndex += 1
            }
        }
        view.updateSpellList()
    }
    
    func add(_ spell: Spell, to book: SpellBook) {
        try! service.realm!.write {
            book.spells.append(spell)
        }
    }
    
    required init(_ view: SpellListInput, service: SpellService) {
        self.view = view
        self.service = service
        self.dataSource = [[]]
        self.filter = Filter(levels: [], profession: [], isConcentration: false, isRitual: false)
    }
}

