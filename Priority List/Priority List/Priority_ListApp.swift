//
//  Priority_ListApp.swift
//  Priority List
//
//  Created by Alex Freitas on 06/06/2023.
//

import SwiftUI
import SwiftData

@main
struct Priority_ListApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
