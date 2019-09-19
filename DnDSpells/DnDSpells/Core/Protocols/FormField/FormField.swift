//
//  FormField.swift
//  instore-osago
//
//  Created by Сергей Мельников on 23.01.2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import UIKit

protocol FormField: AnyObject {
    var formFieldDelegate: FormFieldDelegate? { get set }
    var valueField: Any? { get set }
    var isError: ValidationError { get set }
    var customValidation: [((Any?) -> ValidationError)] { get set }
    var nextField: FormField? { get set }
    
    func becomeFirstResponder() -> Bool
    func getListOfValidationErrors() -> [ValidationError]
    
    /// Валидирует поле по customValidation. Если все проверки в customValidation возвращают .success, тогда validation(scrolling:) вернет true.
    ///
    /// - Parameter scrolling: Нужно ли выполнить becomeFirstResponder() на поле если есть хоть одна ошибка
    /// - Returns: Возвращает - корректное ли значение в поле на основании customValidation
    func validation(_ scrolling: Bool) -> Bool
}

extension FormField {
    func getListOfValidationErrors() -> [ValidationError] {
        var result: [ValidationError] = []
        customValidation.forEach {
            let tmp = $0(valueField)
            switch tmp {
            case .failure(_):
                result.append(tmp)
            case .success:
                ()
            }
        }
        return result
    }
    
    func validation(_ scrolling: Bool) -> Bool {
        let allError = getListOfValidationErrors()
        if let firstError = allError.first {
            if scrolling { _ = becomeFirstResponder() }
            isError = firstError
        } else {
            isError = .success
        }
        return isError == .success
    }
}
