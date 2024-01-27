//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Sachin Nair on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature = 0.0
    @State private var inputTemperatureUnit = "C"
    @State private var outputTemperatureUnit = "C"
    
    var outputTemperatureInCelsius: Double {
        if (inputTemperatureUnit == "C") {
            return inputTemperature
        } else if (inputTemperatureUnit == "F") {
            return (inputTemperature - 32) * 5 / 9
        } else if (inputTemperatureUnit == "K") {
            return inputTemperature - 273
        }
        
        return 0
    }
    
    var outputTemperature: Double {
        if (outputTemperatureUnit == "C") {
            return outputTemperatureInCelsius
        } else if (outputTemperatureUnit == "F") {
            return (outputTemperatureInCelsius * 9 / 5) + 32
        } else if (outputTemperatureUnit == "K") {
            return outputTemperatureInCelsius + 273
        }
        
        return 0
    }
    
    let temperatures = ["C", "F", "K"]
    
    var body: some View {
        Form {
            Section("Enter Temperature") {
                TextField("Amount", value: $inputTemperature, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("Input Temperature Unit") {
                Picker("Input Temperature Unit", selection: $inputTemperatureUnit) {
                    ForEach(temperatures, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Output Temperature Unit") {
                Picker("Output Temperature Unit", selection: $outputTemperatureUnit) {
                    ForEach(temperatures, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Output Temperature") {
                Text(outputTemperature, format: .number)
            }
        }
    }
}

#Preview {
    ContentView()
}
