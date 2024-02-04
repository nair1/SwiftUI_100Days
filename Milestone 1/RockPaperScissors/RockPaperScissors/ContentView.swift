//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sachin Nair on 2/4/24.
//

import SwiftUI

struct GameOptionText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func gameOptionText() -> some View {
        modifier(GameOptionText())
    }
}

struct PlayerView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(maxWidth: 300)
    }
}

extension View {
    func playerView() -> some View {
        modifier(PlayerView())
    }
}

struct ContentView: View {
    let gameOptions = ["🪨", "📄", "✂️"]
    
    @State private var CPUOption = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var totalQuestions = 0
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                Text("Try to \(playerShouldWin ? "Win" : "Lose")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack {
                    HStack {
                        Text("CPU")
                            .foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        Text(gameOptions[CPUOption])
                            .gameOptionText()
                    }
                    .playerView()
                    
                    HStack {
                        Text("Player")
                            .foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        ForEach(0...2, id: \.self) { buttonOption in
                            Button(gameOptions[buttonOption]) {
                                playGameRound(selection: buttonOption)
                            }
                                .gameOptionText()
                        }
                    }
                    .playerView()
                }
                
                Text("Score: \(playerScore)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("Continue", action: generateNewRound)
        }
    }
    
    func generateNewRound() {
        CPUOption = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
    
    func playGameRound(selection: Int) {
        let resultMatrix: [[GameResult]] = [
            [.TIE, .LOSE, .WIN],
            [.WIN, .TIE, .LOSE],
            [.LOSE, .WIN, .TIE]
        ]
        
        let gameResult = resultMatrix[selection][CPUOption]
        totalQuestions += 1
        
        if gameResult == .TIE {
            alertMessage = "Tie 😐"
        } else {
            alertMessage = playerShouldWin == (gameResult == .WIN) ? "Correct! ✅" : "Wrong! ❌"
            playerScore += (playerShouldWin == (gameResult == .WIN) ? 1 : -1)
        }
        
        showingAlert = true
    }
}

enum GameResult {
    case WIN, LOSE, TIE
}

#Preview {
    ContentView()
}
