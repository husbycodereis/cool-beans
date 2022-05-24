//
//  FileManager-DocumentsDirectory.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 24.05.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
