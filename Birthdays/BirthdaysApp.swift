//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Prajakta Kulkarni on 23/09/2025.
//

import SwiftUI
import SwiftData
@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
