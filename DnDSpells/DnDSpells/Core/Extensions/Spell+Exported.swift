//
//  Spell+Exported.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 01/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation
import RealmSwift

extension Array: Imported where Element == Spell {
    static func `import`<T: Codable>(_ url: URL) throws -> T {
        let data = try Data(contentsOf: url)
        let spellsJSON = try JSONDecoder().decode([Spell].self, from: data)
        let service = SpellService.shared()
        let books = service.realm!.objects(Book.self)
        let school = service.realm!.objects(School.self)
        let professions = service.realm!.objects(Profession.self)
        let components = service.realm!.objects(Component.self)
        let spells = spellsJSON.map({ spell -> Spell in
            let tmpComponents = List<Component>()
            spell.components.forEach { component in
                guard let item = components.first(where: ({ $0.id == component.id })) else { return }
                tmpComponents.append(item)
            }
            spell.components = tmpComponents
            let tmpBook = List<Book>()
            spell.source.forEach { book in
                guard let item = books.first(where: ({ $0.id == book.id })) else { return }
                tmpBook.append(item)
            }
            spell.source = tmpBook
            spell.school = school.first(where: { spell.school?.id == $0.id })
            let tmpProfesstions = List<Profession>()
            spell.professions.forEach { profession in
                guard let item = professions.first(where: ({ $0.id == profession.id })) else { return }
                tmpProfesstions.append(item)
            }
            spell.professions = tmpProfesstions
            return spell
        })
        return spells as! T
    }
}
