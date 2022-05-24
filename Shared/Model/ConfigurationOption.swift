//
//  ConfigurationOption.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import Foundation
// Hashable helps each item to run ForEach loops
struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
