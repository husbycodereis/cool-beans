//
//  Drink.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import Foundation

// identifiable means every item inside the Drink struct is unique
// Codable means the Model can be parsed to or from JSON
struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Drink(id: UUID(), name: "Some Drink", caffeine: [60, 120, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}
