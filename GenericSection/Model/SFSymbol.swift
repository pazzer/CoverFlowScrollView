//
//  SFSymbol.swift
//  GenericSection
//
//  Created by Paul Patterson on 10/07/2024.
//

import Foundation

public typealias SFSymbol = String

extension SFSymbol: Identifiable {
    
    public var id: SFSymbol {
        self
    }
}
