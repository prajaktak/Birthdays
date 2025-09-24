//
//  File.swift
//  Birthdays
//
//  Created by Prajakta Kulkarni on 23/09/2025.
//

import Foundation
import SwiftData

@Model
class    Friend {
    var name: String
    var birthday: Date

    var birthMonth: Int
    var birthDay: Int
    
    var isBirthdayToday: Bool {
        if Calendar.current.component(.month, from: birthday) == Calendar.current.component(.month, from: .now) {
            if Calendar.current.component(.day, from: birthday) == Calendar.current.component(.day, from: .now) {
                return true
            }
        }
        return false
    }

    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
        let comps = Calendar.current.dateComponents([.month, .day], from: birthday)
        self.birthMonth = comps.month ?? 1
        self.birthDay = comps.day ?? 1
    }
}
