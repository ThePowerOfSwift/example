//
//  IOTagNavigationBar.swift
//  instore-osago
//
//  Created by Сергей Мельников on 20.11.2018.
//  Copyright © 2018 SL-Tech. All rights reserved.
//

import UIKit

class MenuCollectionValue: NSObject {
    @objc var title: String
    @objc var state: Int
    
    init(_ title: String, state: Int) {
        self.title = title
        self.state = state
    }
}

protocol MenuCollectionDelegate: AnyObject {
    
    /// Содержит текущие значения для вывода item в collectionView.
    var menuObjects: [MenuCollectionValue] { get }
    
    /// Была попытка выбрать новый item.
    ///
    /// - Parameters:
    ///   - tagNavigationBar: Объект TagNavigationBar
    ///   - indexPath: index
    func tagNavigationBar(_ tagNavigationBar: MenuCollection, shouldSelectItemAt indexPath: IndexPath)
    
    /// Обновить текст всех item.
    func updateTextOfMenuObjects()
}

extension MenuCollectionDelegate {
    
    /// Обновить полностью состояние items. В начале обновляет title, затем обновляет state.
    ///
    /// - Parameter index: Индекс item с state == .selected
    func updateAllState(selectedItemIndex index: Int) {
        updateTextOfMenuObjects()
        for (i, value) in menuObjects.enumerated() {
            if i < index {
                value.state = IOMenuTagCellState.filled.rawValue
            } else if i == index {
                value.state = IOMenuTagCellState.selected.rawValue
            } else {
                value.state = IOMenuTagCellState.disabled.rawValue
            }
        }
    }
}
