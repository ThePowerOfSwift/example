//
//  BookCell.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet private var nameBook: UILabel!
    @IBOutlet private var infoLabel: UILabel!
    
    var book: SpellBook? {
        didSet {
            guard let book = book else { return }
            nameBook.text = book.name
            infoLabel.text = "Заклинаний в книге: \(book.spells.count)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
