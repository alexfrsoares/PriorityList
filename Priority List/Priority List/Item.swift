//
//  Item.swift
//  Priority List
//
//  Created by Alex Freitas on 06/06/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
