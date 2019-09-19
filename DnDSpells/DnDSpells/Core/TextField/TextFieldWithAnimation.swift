//
//  TextFieldWithAnimation.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

final class TextFieldWithAnimation: UITextField {
    
    var animationRun: Bool = false
    private var selectedState: SelectionState = .none
    
    // MAKR: - FormField
    weak var formFieldDelegate: FormFieldDelegate?
    var isError: ValidationError = .success {
        didSet {
            switch isError {
            case .success:
                selectedState = canBecomeFirstResponder ? .none : .selected
                selectionAnimation()
                placeholderLabel.text = defaultPlaceholder
                placeholderLabel.textColor = defaultPlaceholderColor
            case .failure(let error):
                selectedState = .error
                selectionAnimation()
                guard let error = error else { break }
                if let formFieldError = error as? FormFieldError {
                    switch formFieldError {
                    case .empty:
                        ()
                    case .validation(_):
                        placeholderLabel.text = error.localizedDescription
                        placeholderLabel.textColor = UIColor.Palette.error
                    }
                } else {
                    placeholderLabel.text = error.localizedDescription
                    placeholderLabel.textColor = UIColor.Palette.error
                }
            }
        }
    }
    
    var nextField: FormField?
    var customValidation: [((Any?) -> ValidationError)] = []
    
    private var line = UIView()
    private var defaultPlaceholderColor: UIColor = UIColor.Palette.lightBlueGrey
    private var defaultPlaceholder: String? = nil
    private var defaultPlaceholderLocation: CGRect!
    private var bottomPlaceholderLocation: CGRect!
    private let placeholderLabel = UILabel()
    
    override var placeholder: String? {
        get { return nil }
        set {
            super.placeholder = nil
            defaultPlaceholder = newValue
            placeholderLabel.text = newValue
        }
    }
    
    var placeholderColor: UIColor = UIColor.Palette.lightBlueGrey {
        didSet {
            defaultPlaceholderColor = placeholderColor
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    // MAKR: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateConstraints()
    }
    
    private func prepare() {
        placeholder = super.placeholder
        placeholderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.textAlignment = .center
        preparePlaceholderLabel()
        prepareLineView()
        borderStyle = .none
        font = UIFont.boldSystemFont(ofSize: 24)
        textColor = UIColor.Palette.darkgrey
    }
    
    private func preparePlaceholderLocation() {
        let size = placeholderLabel.intrinsicContentSize
        let width = bounds.width
        let height = size.height
        defaultPlaceholderLocation = CGRect(x: bounds.width / 2 - width / 2, y: bounds.height / 2 - height / 2, width: width, height: height)
        bottomPlaceholderLocation = CGRect(x: bounds.width / 2 - width / 2, y: bounds.height + 8, width: width, height: height)
    }
    
    private func preparePlaceholderLabel() {
        placeholderLabel.removeFromSuperview()
        preparePlaceholderLocation()
        placeholderLabel.frame = isFirstResponder ? bottomPlaceholderLocation : defaultPlaceholderLocation
        addSubview(placeholderLabel)
    }
    
    private func prepareLineView() {
        let width = bounds.width
        let height = bounds.height
        line.frame = CGRect(x: 0, y: height - 1, width: width, height: 1)
        line.backgroundColor = UIColor.Palette.lightBlueGrey
        line.clipsToBounds = true
        addSubview(line)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        let width = bounds.width
        let height = bounds.height
        line.frame = CGRect(x: 0, y: height - 1, width: width, height: 1)
        preparePlaceholderLocation()
        if text != nil && !text!.isEmpty || isFirstResponder {
            placeholderLabel.frame = bottomPlaceholderLocation
        } else {
            placeholderLabel.frame = defaultPlaceholderLocation
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        if selectedState == .none {
            selectedState = .selected
            selectionAnimation()
        }
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let `self` = self else { return }
            self.placeholderLabel.frame = self.bottomPlaceholderLocation
        }
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        if validation(false) {
            selectedState = .none
            selectionAnimation()
        }
        if let unwrapText = text, unwrapText.isEmpty {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let `self` = self else { return }
                self.placeholderLabel.frame = self.defaultPlaceholderLocation
            }
        }
        return super.resignFirstResponder()
    }
}

extension TextFieldWithAnimation: FormTextField { }

extension TextFieldWithAnimation: SelectionAnimation {
    
    var currentSelectionState: SelectionState {
        return selectedState
    }
    
    var lineOfAnimation: UIView! {
        get { return line }
    }
}

