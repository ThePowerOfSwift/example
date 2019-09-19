//
//  SpellCell2.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 22/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class SpellCell2: UITableViewCell {

    var spell: Spell! {
        didSet {
            guard let spell = spell else { return }
            nameLabel.text = spell.name
            if spell.language == "ru" {
                descriptionLabel.text = (spell.level == 0 ? "Заговор, " : "\(spell.level) уровня, ") + (spell.school?.nameRus ?? "неизвестной школы")
            } else {
                descriptionLabel.text = (spell.level == 0 ? "Cantrip, " : "\(spell.level) level, ") + (spell.school?.nameEng ?? "other scholl")
            }
        }
    }
    var index: IndexPath!
    weak var delegate: SpellCellTouches!
    var isHiddenAddButton = false {
        didSet {
            otherButton.isHidden = isHiddenAddButton
            separatorView.isHidden = isHiddenAddButton
        }
    }
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var separatorView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var otherButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowColor = #colorLiteral(red: 0.6352941176, green: 0.6352941176, blue: 0.6352941176, alpha: 0.3)
        cellView.layer.shadowRadius = 8
        cellView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cellView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func touchOther(_ sender: Any) {
        delegate?.touchSpellCell(index)
    }
}
