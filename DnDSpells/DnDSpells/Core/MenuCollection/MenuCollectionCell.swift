//
//  IOMenuTagCell.swift
//  instore-osago
//
//  Created by Сергей Мельников on 21.11.2018.
//  Copyright © 2018 SL-Tech. All rights reserved.
//

import UIKit

enum IOMenuTagCellState: Int {
    case selected
    case filled
    case disabled
}

class MenuCollectionCell: UICollectionViewCell {

    weak var value: MenuCollectionValue? {
        didSet {
            guard let value = value else { return }
            titleLabel.text = value.title
            state = IOMenuTagCellState(rawValue: value.state) ?? .disabled
        }
    }
    
    private var state: IOMenuTagCellState = .disabled {
        didSet { prepareUI() }
    }
    
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.cornerRadius = 4
        prepareUI()
    }

    private func prepareUI() {
        switch state {
        case .disabled:
            titleLabel.textColor = UIColor.Palette.grey.withAlphaComponent(0.6)
            layer.borderColor = UIColor.Palette.disadled.cgColor
            backgroundColor = .clear
        case .filled:
            titleLabel.textColor = UIColor.Palette.grey
            layer.borderColor = UIColor.Palette.grey.withAlphaComponent(0.2).cgColor
            backgroundColor = UIColor.Palette.grey.withAlphaComponent(0.2)
        case .selected:
            titleLabel.textColor = UIColor.Palette.darkgrey
            layer.borderColor = UIColor.Palette.grey.cgColor
            backgroundColor = .clear
        }
    }
}
