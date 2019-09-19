//
//  CustomNC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 13/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class CustomNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = true
        navigationBar.layer.backgroundColor = UIColor(patternImage: UIImage(named: "navigation")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: navigationBar.frame.size.width/2, bottom: 10, right: navigationBar.frame.size.width/2), resizingMode: .stretch)).cgColor
    }
}
