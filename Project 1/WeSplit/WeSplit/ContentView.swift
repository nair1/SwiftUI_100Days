//
//  ContentView.swift
//  WeSplit
//
//  Created by Sachin Nair on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry","Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
            }
            .navigationTitle("Select a student")
        }
    }
}

#Preview {
    ContentView()
}
