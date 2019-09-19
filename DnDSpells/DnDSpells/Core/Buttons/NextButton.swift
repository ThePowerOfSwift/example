//
//  NextButton.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 13/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

final class NextButton: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        setTitle("Дальше", for: .normal)
        setTitleColor(.white, for: .normal)
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareUI()
    }
    
    private func prepareUI() {
        backgroundColor = .red
        layer.cornerRadius = 4
    }

}
