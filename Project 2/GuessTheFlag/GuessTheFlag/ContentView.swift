//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sachin Nair on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
        }
    }
    
    func executeDelete() {
        print("Now Deleting...")
    }
}

#Preview {
    ContentView()
}
