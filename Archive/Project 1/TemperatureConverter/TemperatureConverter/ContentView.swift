//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Sachin Nair on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature = 0.0
    @State private var selectedInputType = "C"
    @State private var selectedOutputType = "C"
    @FocusState private var amountIsFocused: Bool
    
    let temperatureTypes = ["C", "F", "K"]
    
    var celsiusTemperature: Double {
        switch selectedInputType {
            case "C":
                return inputTemperature
            case "F":
                return (inputTemperature - 32) * 5 / 9
            case "K":
                return inputTemperature - 273
            default:
                return 0
        }
    }
    
    var finalTemperature: Double {
        switch selectedOutputType {
            case "C":
                return celsiusTemperature
            case "F":
                return (celsiusTemperature * 9 / 5) + 32
            case "K":
                return celsiusTemperature + 273
            default:
                return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Temperature") {
                    TextField("Temperature", value: $inputTemperature, format: .number)
                        .focused($amountIsFocused)
                }
                
                Section("Input Unit") {
                    Picker("Unit", selection: $selectedInputType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Unit") {
                    Picker("Unit", selection: $selectedOutputType) {
                        ForEach(temperatureTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Temperature") {
                    Text(finalTemperature, format: .number)
                }
            }
            .navigationTitle("TemperatureConverter")
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
