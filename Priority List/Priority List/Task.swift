//
//  Task.swift
//  Priority List
//
//  Created by Alex Freitas on 06/06/2023.
//

import Foundation
import SwiftData

@Model
class Task {
    var activity: String
    var priority: Int
    var done: Bool = false

    init(activity: String, priority: Int) {
        self.activity = activity
        self.priority = priority
    }
}
