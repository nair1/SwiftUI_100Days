//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sachin Nair on 1/27/24.
//

import SwiftUI

struct FlagImage: View {
    var countrySelection: String
    
    var body: some View {
        Image(countrySelection)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    @State private var showingAlert = false
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var userScore = 0
    @State private var totalQuestions = 0
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
//                    .font(.largeTitle)
//                    .bold()
//                    .foregroundStyle(.white)
                    .prominentTitle()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                            .fontWeight(.heavy)
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(countrySelection: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMessage)
        }
    }
    
    func flagTapped(_ number: Int) {
        totalQuestions += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
            alertMessage = ""
        } else {
            scoreTitle = "Wrong!"
            alertMessage = "That's the flag of \(countries[number])"
        }
        
        if totalQuestions == 8 {
            scoreTitle = "Final Score"
            alertMessage = "\(userScore) / \(totalQuestions)"
            userScore = 0
            totalQuestions = 0
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
