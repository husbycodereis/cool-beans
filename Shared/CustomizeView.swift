//
//  CustomizeView.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import SwiftUI

enum SizeOptions: String, CaseIterable{
    case Small, Medium, Large
}

struct CustomizeView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var history: History
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    let sizeOptions = SizeOptions.allCases
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60)
        
        if isDecaf {
            caffeineAmount /= 20
        }
        return caffeineAmount
    }
    
    var calories: Int {
        var calorieAmount = drink.baseCalories
        calorieAmount += extraShots * 10
        
        if drink.coffeeBased {
            calorieAmount += milk.calories
        } else {
            calorieAmount += milk.calories / 8
        }
        
        calorieAmount += syrup.calories
        return calorieAmount * (size + 1)
    }
    
    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    //it can also be written as ForEach(sizeOptions.indices, id: \.self)
                    //When using ForEach in #SwiftUI with a non-constant range, remember to pass it an id.
                    ForEach(0 ..< sizeOptions.count, id: \.self) {index in
                        Text(sizeOptions[index].rawValue)
                    }
                }
                .pickerStyle(.segmented)
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)",
                value: $extraShots, in: 0...8)
                }
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            Section("Customizations"){
                Picker("Milk", selection: $milk){
                    ForEach(menu.milkOptions){option in
                        Text(option.name)
                            .tag(option)
                    }
                }
            }
            
            if drink.coffeeBased {
                Picker("Syrup", selection: $syrup) {
                    ForEach(menu.syrupOptions) {option in
                        Text(option.name)
                            .tag(option)
                    }
                }
            }
            Section("Estimates") {
                Text("Caffeine: \(caffeine)mg")
                Text("Calories: \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
    }
}
