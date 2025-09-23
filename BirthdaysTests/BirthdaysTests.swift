//
//  BirthdaysTests.swift
//  BirthdaysTests
//
//  Created by Prajakta Kulkarni on 23/09/2025.
//
import Foundation
import Testing
@testable import Birthdays

struct BirthdaysTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    @Test("Today is Birthday")
    func isTodayBirthday() async throws {
        let friend: Friend = Friend(name: "Prajakta", birthday: .now)
        #expect(true == friend.isBirthdayToday)
    }
    
    @Test("Today is a 30th Birthday")
    func isToday30ThBirthday() async throws {
        let date = Calendar.current.date(byAdding: .year, value: 30, to: .now)!
        print(date)
        let friend: Friend = Friend(name: "Prajakta", birthday: date)
        #expect(true == friend.isBirthdayToday)
    }
    
    @Test("Today is Not a Birthday")
    func isNotTodayBirthday() async throws {
        let date = Calendar.current.date(byAdding: .day, value: 1, to: .now)!
        let friend: Friend = Friend(name: "Prajakta", birthday: date)
        #expect(false == friend.isBirthdayToday)
    }
}
