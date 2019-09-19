//
//  AddSpellBookInput.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

protocol AddSpellBookInput: AnyObject {
    var nameSpellBook: FormField! { get }
    
    func successCreate()
}
