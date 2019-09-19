//
//  TextLabel.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 18/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class TextLabel: UILabel {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.textColor = UIColor.Palette.grey
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
}
