//
//  SpellCell.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 18/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class SpellCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var levelLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var spell: Spell? {
        didSet {
            guard let spell = spell else { return }
            nameLabel.text = spell.name
            descriptionLabel.text = spell.spellDescription
            
            var components: [String] = []
            for component in spell.components {
                if spell.language == "ru" {
                    components.append(component.nameRus)
                } else {
                    components.append(component.nameEng)
                }
            }
            if spell.language == "ru" {
                levelLabel.text = (spell.level == 0 ? "Заговор, " : "\(spell.level) уровня, ") + (spell.school?.nameRus ?? "неизвестной школы")
            } else {
                levelLabel.text = (spell.level == 0 ? "Cantrip, " : "\(spell.level) level, ") + (spell.school?.nameEng ?? "other scholl")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        UIFont.preferredFont(forTextStyle: .title1)
//        UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1), size: 20)
//        nameLabel.font
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchAddSpell(_ sender: Any) {
        print("Add")
    }
}
