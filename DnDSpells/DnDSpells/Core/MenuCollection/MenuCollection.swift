//
//  IOTagNavigationBarImpl.swift
//  instore-osago
//
//  Created by Сергей Мельников on 23.01.2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import UIKit

fileprivate let nibNameCell = "IOMenuTagCell"
fileprivate let identifierCell = "Cell"

final class MenuCollection: UICollectionView {
    
    weak var tagNavigationBarDelegate: MenuCollectionDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    private func prepare() {
        delegate = self
        dataSource = self
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        register(UINib(nibName: nibNameCell, bundle: nil), forCellWithReuseIdentifier: identifierCell)
    }
}

extension MenuCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagNavigationBarDelegate?.menuObjects.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let baseCell = cell as? MenuCollectionCell else { fatalError("Не найдена ячейка") }
        baseCell.value = tagNavigationBarDelegate?.menuObjects[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let delegate = tagNavigationBarDelegate else {
            return CGSize(width: 32, height: 37)
        }
        let tmpLabel = UILabel()
        tmpLabel.text = delegate.menuObjects[indexPath.row].title
        return CGSize(width: tmpLabel.intrinsicContentSize.width + 32, height: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        tagNavigationBarDelegate?.tagNavigationBar(self, shouldSelectItemAt: indexPath)
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //        print("DidHighlight")
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        //        print("UNhightlight")
    }
    
    override func reloadData() {
        super.reloadData()
        let index = tagNavigationBarDelegate?.menuObjects
            .enumerated()
            .first(where: { return $0.element.state == IOMenuTagCellState.selected.rawValue })?.offset ?? 0
        selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}
