//
//  TitleLabel.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 13/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.textColor = UIColor.Palette.darkgrey
        self.font = UIFont.boldSystemFont(ofSize: 16)
    }

}
