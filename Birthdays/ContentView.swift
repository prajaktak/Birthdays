//
//  ContentView.swift
//  Birthdays
//
//  Created by Prajakta Kulkarni on 23/09/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: [
        SortDescriptor(\Friend.birthMonth, order: .forward),
        SortDescriptor(\Friend.birthDay, order: .forward)
    ])private var friends: [Friend]
    @Environment(\.modelContext) private var context

    @State private var newName: String = ""
    @State private var newDate: Date = Date()
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker( selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField( "name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
