//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sachin Nair on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var currentScore = 0
    @State private var totalGuesses = 0
    
    var scoreAsPercentage: String {
        var scoreAsPercentage = 0.0
        
        if (totalGuesses > 0) {
            scoreAsPercentage = Double(currentScore) / Double(totalGuesses)
        }
        
        print(currentScore)
        print(totalGuesses)
        print(scoreAsPercentage)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter
            .string(from: NSNumber(value: scoreAsPercentage)) ?? ""
    }
    
    var upperColor = Color(red: 0.1, green: 0.2, blue: 0.45)
    var lowerColor = Color(red: 0.76, green: 0.15, blue: 0.26)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: upperColor, location: 0.3),
                .init(color: lowerColor, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)/\(totalGuesses)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text(scoreAsPercentage)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)/\(totalGuesses)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            currentScore += 1
        } else {
            scoreTitle = "Wrong! That's \(countries[number])"
        }
        
        showingScore = true
        totalGuesses += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
