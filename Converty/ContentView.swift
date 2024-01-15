//
//  ContentView.swift
//  Converty
//
//  Created by Görkem Güray on 15.01.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var valueForConvert = 20.0
    @State private var valueForConvertUnit = "Celsius"
    @State private var convertedValueUnit = "Fahrenheit"
    
    var convertedValue: Double {
        let baseTempInCelsius: Double
        
        switch(valueForConvertUnit) {
        case "Celsius":
            baseTempInCelsius = valueForConvert
            
        case "Fahrenheit":
            baseTempInCelsius = (valueForConvert - 32)/1.8
            
        case "Kelvin":
            baseTempInCelsius = valueForConvert - 273.15
            
        default:
            baseTempInCelsius = 0
        }
        
        let convertedValueFromCelcius: Double
        switch(convertedValueUnit) {
        case "Celsius":
            convertedValueFromCelcius = baseTempInCelsius
            
        case "Fahrenheit":
            convertedValueFromCelcius = valueForConvert * 1.8 + 32
            
        case "Kelvin":
            convertedValueFromCelcius = valueForConvert + 273.15
            
        default:
            convertedValueFromCelcius = 0
        }
        
        return convertedValueFromCelcius
    }
    
    
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section("Value for Convert"){
                    TextField("Temperature",
                              value: $valueForConvert,
                              format: .number.decimalSeparator(strategy: .automatic))
                    .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $valueForConvertUnit) {
                        ForEach(tempUnits, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Converted Value") {
                    Picker("Unit", selection: $convertedValueUnit) {
                        ForEach(tempUnits, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("Converted Value : \(convertedValue .formatted(.number.decimalSeparator(strategy: .automatic)))")
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
