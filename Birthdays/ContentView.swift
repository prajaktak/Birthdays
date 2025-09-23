//
//  ContentView.swift
//  Birthdays
//
//  Created by Prajakta Kulkarni on 23/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Prajakta", birthday: .now),
        Friend(name: "Sarang", birthday: Date(timeIntervalSince1970: 0))
    ]
    @State private var newName: String = ""
    @State private var newDate: Date = Date()
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
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
                        friends.append(newFriend)
                        
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
}
