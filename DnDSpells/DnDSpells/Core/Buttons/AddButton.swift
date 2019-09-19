//
//  AddButton.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 16/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

enum AddButtonState {
    case disclosed
    case rolledUp
}

final class AddButton: UIButton {
    
    var addState: AddButtonState = .rolledUp
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareUI()
    }
    
    private func prepareUI() {
        setImage(UIImage(named: "plus"), for: .normal)
        layer.cornerRadius = bounds.height / 2
        imageView?.tintColor = UIColor.white
        backgroundColor = UIColor.button
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10.0
        layer.masksToBounds = false
    }
    
}
