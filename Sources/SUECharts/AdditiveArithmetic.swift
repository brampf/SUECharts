//
//  File.swift
//  
//
//  Created by May on 27.12.20.
//

import Foundation

extension AdditiveArithmetic {
    
    var double : Double {
        
        switch self {
        case let me as Double:
            return me
        case let me as Float:
            return Double(me)
        case let me as Int:
            return Double(me)
        default:
            return .zero
        }
    }
    
}
