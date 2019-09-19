//
//  Monster+Action.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 20/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import Foundation

extension Monster {
    struct Action: Codable {
        var name: String = ""
        var text: String = ""
        var attack: [String] = []
    }
}
