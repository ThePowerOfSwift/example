//
//  AddSpellBookPresenter.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import RealmSwift

class AddSpellBookPresenter: AddSpellBookOutput {
    private weak var view: AddSpellBookInput!
    private let service: SpellService
    
    func saveSpellBook() {
        guard view.nameSpellBook.validation(true) else { return }
        let nameSpellBook: String = getValue(view.nameSpellBook) ?? ""
        service.createSpellBook(nameSpellBook, spells: [])
        view.successCreate()
    }
    
    required init(_ view: AddSpellBookInput, service: SpellService) {
        self.view = view
        self.service = service
        view.nameSpellBook.customValidation = [Validation.isNotEmpty]
    }
    
    func getValue<T>(_ field: FormField) -> T? {
        return field.valueField as? T
    }
}
