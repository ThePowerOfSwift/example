//
//  FilterVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 22/08/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import M13Checkbox
import RealmSwift

class FilterVC: UIViewController {

    fileprivate var feedbackGenerator : UISelectionFeedbackGenerator?
    private var service = SpellService.shared()
    
    @IBOutlet private var levelsSpellCheckbox: [M13Checkbox]!
    @IBOutlet private var applyButton: UIButton!
    
    private var dataSourceClass: [String] = []
    @IBOutlet private var classTags: IOTags!
    @IBOutlet private var heightClassTagsConstraint: NSLayoutConstraint!
    
    private var dataSourceBook: [String] = []
    @IBOutlet private var bookTags: IOTags!
    @IBOutlet private var heightBookTagsConstraint: NSLayoutConstraint!
    
    @IBOutlet var concentrationSwitch: UISwitch!
    @IBOutlet var ritualSwitch: UISwitch!
    
    var filter: Filter!
    weak var delegate: SpellListInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSourceClass = service.realm?.objects(Profession.self).map({ $0.nameRus }) ?? []
        dataSourceBook = service.realm?.objects(Book.self).map({ $0.nameRus }) ?? []
        classTags.protocolDataSource = self
        bookTags.protocolDataSource = self
        feedbackGenerator = UISelectionFeedbackGenerator()
        applyButton.layer.cornerRadius = 8
        concentrationSwitch.isOn = filter.isConcentration
        ritualSwitch.isOn = filter.isRitual
        prepareCheckboxs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareClassTags()
        prepareBookTags()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareClassTags()
    }
    
    @IBAction func touchClear() {
        filter = Filter.init(levels: [], profession: [], isConcentration: false, isRitual: false)
        prepareClassTags()
        prepareBookTags()
        prepareCheckboxs()
        concentrationSwitch.isOn = filter.isConcentration
        ritualSwitch.isOn = filter.isRitual
    }
    
    @objc func touchBox(_ sender: Any) {
        feedbackGenerator?.selectionChanged()
        feedbackGenerator?.prepare()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.global().async {
            usleep(500_000)
            DispatchQueue.main.async {
                self.prepareClassTags()
            }
        }
        
    }

    @IBAction func touchAppleFilter(_ sender: Any) {
        let levels = levelsSpellCheckbox.map { checkbox -> Int? in
            return checkbox.checkState == .checked ? checkbox.tag : nil
        }.compactMap { $0 }
        
        var professions: [Profession] = []
        if let index = classTags.indexPathsForSelectedItems {
            let names = index.map { (classTags.cellForItem(at: $0) as! IOTagCell).title }
            if let unwrapResult = (service.realm?.objects(Profession.self).filter(NSPredicate(format: "nameRus IN %@", names))) {
                professions = Array(unwrapResult)
            }
        }
        delegate.setFilter(Filter(levels: levels, profession: professions, isConcentration: concentrationSwitch.isOn, isRitual: ritualSwitch.isOn))
        navigationController?.popViewController(animated: true)
    }
}

extension FilterVC: FilterInput {
    
}


extension FilterVC: IOTagsDataSource {
    func components(_ tags: IOTags) -> [CustomStringConvertible] {
        if tags == classTags {
            return dataSourceClass
        } else {
            return dataSourceBook
        }
    }
}

extension FilterVC {
    fileprivate func prepareClassTags() {
        classTags.prepareSpacingBeetwenCells()
        classTags.reloadData()
        heightClassTagsConstraint.constant = classTags.collectionViewLayout.collectionViewContentSize.height
        for prof in filter.profession {
            guard let row = classTags.correctDataSource.enumerated().first(where: { $0.element == prof.nameRus })?.offset else { continue }
            classTags.selectItem(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        }
    }
    
    fileprivate func prepareBookTags() {
        bookTags.prepareSpacingBeetwenCells()
        bookTags.reloadData()
        heightBookTagsConstraint.constant = bookTags.collectionViewLayout.collectionViewContentSize.height
    }
    
    fileprivate func prepareCheckboxs() {
        for (index, checkbox) in levelsSpellCheckbox.enumerated() {
            if filter.levels.contains(index) {
                checkbox.setCheckState(.checked, animated: false)
            } else {
                checkbox.setCheckState(.unchecked, animated: false)
            }
            
            checkbox.secondaryTintColor = UIColor.Palette.systemGray2
            checkbox.stateChangeAnimation = .fill
            checkbox.addTarget(self, action: #selector(touchBox(_:)), for: .valueChanged)
        }
    }
}
