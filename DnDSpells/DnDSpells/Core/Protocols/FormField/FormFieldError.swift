//
//  FormFieldError.swift
//  instore-osago
//
//  Created by Сергей Мельников on 01/03/2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import Foundation

enum FormFieldError: Error, LocalizedError {
    case empty
    case validation(String?)
    
    var errorDescription: String? {
        switch self {
        case .empty:
            return "Поле не может быть пустым"
        case .validation(let message):
            return message ?? "Не корректное значение в поле"
        }
    }
}
