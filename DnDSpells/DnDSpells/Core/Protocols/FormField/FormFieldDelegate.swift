//
//  FormFieldDelegate.swift
//  instore-osago
//
//  Created by Сергей Мельников on 01/03/2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import Foundation

protocol FormFieldDelegate: AnyObject {
    func formField(_ formField: FormField, didChange value: Any?)
}

extension FormFieldDelegate {
    func formField(_ formField: FormField, didChange value: Any?) {}
}
