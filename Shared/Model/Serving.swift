//
//  Serving.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffeine : Int
    let calories: Int
}
