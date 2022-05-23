//
//  CustomizeView.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import SwiftUI

struct CustomizeView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    let sizeOptions = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
    }
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOptions.indices) {index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                Toggle("Decaffeinated", isOn: $isDecaf)
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
