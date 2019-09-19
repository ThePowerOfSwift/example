//
//  IOTagCell.swift
//  instore-osago
//
//  Created by Сергей Мельников on 25.10.2018.
//  Copyright © 2018 SL-Tech. All rights reserved.
//

import UIKit

class IOTagCell: UICollectionViewCell {

    var title: String = "" {
        didSet {
            titleLabel.text = title
            mainView.isHidden = title.isEmpty
        }
    }
    override var isSelected: Bool {
        willSet {
            mainView.layer.borderColor = newValue ? UIColor.Palette.dodgerBlue.cgColor : UIColor.Palette.systemGray2.cgColor
            mainView.backgroundColor = newValue ? UIColor.Palette.dodgerBlue : UIColor.clear
            titleLabel.textColor = newValue ? UIColor.Palette.background : UIColor.Palette.systemGray2
        }
    }
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = isSelected ? UIColor.Palette.dodgerBlue.cgColor : UIColor.Palette.systemGray2.cgColor
        mainView.backgroundColor = isSelected ? UIColor.Palette.dodgerBlue : UIColor.clear
        titleLabel.textColor = isSelected ? UIColor.Palette.background : UIColor.Palette.systemGray2
    }
}
