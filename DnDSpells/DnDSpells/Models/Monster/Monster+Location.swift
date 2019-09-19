//
//  Monster+Location.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 20/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

extension Monster {
    struct Location: Codable {
        var text: String = ""
        var list: [String] = []
    }
}
