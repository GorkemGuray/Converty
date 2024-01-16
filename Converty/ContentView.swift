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
        
        let baseTemp: Measurement<UnitTemperature>
        
        switch(valueForConvertUnit) {
        case "Celsius":
            baseTemp = Measurement(value: valueForConvert, unit: UnitTemperature.celsius)
            
        case "Fahrenheit":
            baseTemp = Measurement(value: valueForConvert, unit: UnitTemperature.fahrenheit)
            
        case "Kelvin":
            baseTemp = Measurement(value: valueForConvert, unit: UnitTemperature.kelvin)
            
        default:
            baseTemp = Measurement(value: valueForConvert, unit: UnitTemperature.celsius)
        }
            
            
        let convertedValueFromCelcius: Double
        switch(convertedValueUnit) {
        case "Celsius":
            convertedValueFromCelcius = baseTemp.converted(to: .celsius).value
                
        case "Fahrenheit":
            convertedValueFromCelcius = baseTemp.converted(to: .fahrenheit).value
                
        case "Kelvin":
            convertedValueFromCelcius = baseTemp.converted(to: .kelvin).value
                
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
