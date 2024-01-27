//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sachin Nair on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("hl")
        }
    }
}

#Preview {
    ContentView()
}
