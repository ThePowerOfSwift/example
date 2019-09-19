//
//  ValidationEmpty.swift
//  instore-osago
//
//  Created by Сергей Мельников on 25.01.2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import Foundation

struct Validation {
    
    /// Проверяет является ли значение хранимое в поле не пустой строкой. Возвращает ошибку если не смог скастить к String или если String.isEmpty
    static let isNotEmpty: ((Any?) -> ValidationError) = { value in
        guard let value = value as? String else { return .failure(error: FormFieldError.empty) }
        return value.isEmpty ? .failure(error: FormFieldError.empty) : .success
    }
    
    /// Проверяет, является ли value == nil. Если да, возвращает ошибку
    static let isUnwrap: ((Any?) -> ValidationError) = { value in
        return value == nil ? .failure(error: FormFieldError.empty) : .success
    }
    
    /// Проверяет, является ли value Int. В начале пробует кастить к Int, потом пробует прикастить к String и от туда уже к Int. Если все не получилось, возвращает ошибку.
    static let isInt: ((Any?) -> ValidationError) = { value in
        if let value = value as? Int {
            return .success
        }
        if let value = value as? String {
            guard let valueInt = Int(value) else { return .failure(error: FormFieldError.validation("Некорректное значение")) }
            return .success
        } else {
            return .failure(error: FormFieldError.validation("Некорректное значение"))
        }
    }
}
