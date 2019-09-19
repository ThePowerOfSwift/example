//
//  SchoolSpellVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class SchoolSpellVC: UIViewController, SchoolSpellInput {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK: - SchoolSpellInput
    var spell: Spell!
}
