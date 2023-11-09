//
//  ContentView.swift
//  WeSplit
//
//  Created by Sachin Nair on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalCheckAmount: Double {
        let tipSelection = Double(tipPercentage)
        let totalTip = checkAmount * tipSelection / 100
        let finalAmount = checkAmount + totalTip
        
        return finalAmount
    }
    
    var totalPerPerson: Double {
        totalCheckAmount / Double(numberOfPeople)
    }
    
    let localizedCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: localizedCurrency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Tip Percentage") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: localizedCurrency))
                }
                
                Section("Total Check Amount") {
                    Text(totalCheckAmount, format: .currency(code: localizedCurrency))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
