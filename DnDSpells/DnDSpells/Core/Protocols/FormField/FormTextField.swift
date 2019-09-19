//
//  FormTextField.swift
//  instore-osago
//
//  Created by Сергей Мельников on 01/03/2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import UIKit

protocol FormTextField: FormField where Self: UITextField { }

extension FormTextField {
    var valueField: Any? {
        get {
            return text
        }
        set {
            guard let value = newValue as? String? else { return }
            text = value
            formFieldDelegate?.formField(self, didChange: newValue)
        }
    }
}
