//
//  ValidationError.swift
//  instore-osago
//
//  Created by Сергей Мельников on 01/03/2019.
//  Copyright © 2019 SL-Tech. All rights reserved.
//

import Foundation

enum ValidationError: Error, LocalizedError, Equatable {
    static func == (lhs: ValidationError, rhs: ValidationError) -> Bool {
        switch lhs {
        case .success:
            switch rhs {
            case .success:
                return true
            case .failure(_):
                return false
            }
        case .failure(_):
            switch rhs {
            case .success:
                return false
            case .failure(_):
                return true
            }
        }
    }
    
    case success
    case failure(error: Error?)
}
