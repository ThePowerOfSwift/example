//
//  SpellVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 19/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import SPStorkController

class SpellVC: UIViewController {

    var spell: Spell!
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var levelAndSchoolLabel: UILabel!
    @IBOutlet private var actionLabel: UILabel!
    @IBOutlet private var componentLabel: UILabel!
    @IBOutlet private var materialLabel: UILabel!
    @IBOutlet private var rangeLabel: UILabel!
    @IBOutlet private var concentrationAndRitualLabel: UILabel!
    @IBOutlet private var descLabel: UILabel!
    @IBOutlet private var booksLabel: UILabel!
    @IBOutlet private var proffectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = spell.name
        if let material = spell.materials, !material.isEmpty {
            materialLabel.text = material.prefix(1).uppercased() + material.dropFirst()
        } else {
            materialLabel.text = nil
        }
        if spell.language == "ru" {
            levelAndSchoolLabel.text = (spell.level == 0 ? "Заговор, " : "\(spell.level) уровня, ") + (spell.school?.nameRus ?? "неизвестной школы")
            componentLabel.text = Array(spell.components.map({ String($0.nameRus.first!) })).joined(separator: ", ")
            booksLabel.text = Array(spell.source.map({ String($0.nameRus) })).joined(separator: ", ")
            proffectionLabel.text = Array(spell.professions.map({ String($0.nameRus) })).joined(separator: ", ")
        } else {
            levelAndSchoolLabel.text = (spell.level == 0 ? "Cantrip, " : "\(spell.level) level, ") + (spell.school?.nameEng ?? "other scholl")
            componentLabel.text = Array(spell.components.map({ String($0.nameEng.first!) })).joined(separator: ", ")
            booksLabel.text = Array(spell.source.map({ String($0.nameEng) })).joined(separator: ", ")
            proffectionLabel.text = Array(spell.professions.map({ String($0.nameEng) })).joined(separator: ", ")
        }
        actionLabel.text = spell.action
        rangeLabel.text = spell.range
        var conAndRit = Array<String?>()
        conAndRit.append(spell.isConcentration ? "Концентрация" : nil)
        conAndRit.append(spell.isRitual ? "Ритуал" : nil)
        concentrationAndRitualLabel.text = conAndRit.compactMap({ $0 }).joined(separator: "/")
        descLabel.text = spell.spellDescription
        let spellDesc = spell.spellDescription
        do {
            let regex = try NSRegularExpression(pattern: "[0-9]{1,}[кd][0-9]{1,}")
            let result = regex.matches(in: spellDesc, range: NSRange(spellDesc.startIndex..., in: spellDesc))
            let attributeString = NSMutableAttributedString(string: spellDesc, attributes: [.font: UIFont.systemFont(ofSize: 17)])
            result.forEach {
                attributeString.addAttributes([.font: UIFont.boldSystemFont(ofSize: 17)], range: $0.range)
            }
            descLabel.attributedText = attributeString
        } catch {
            
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SpellVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        SPStorkController.scrollViewDidScroll(scrollView)
    }
}
