//
//  Menu.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import Foundation

//menu is created as class in order to inject it to different parts of UI

class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    var milkOptions = [ConfigurationOption.none]
    var syrupOptions = [ConfigurationOption.none]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            
            sections = menuData.sections
            milkOptions.append(contentsOf: menuData.milkOptions)
            syrupOptions.append(contentsOf: menuData.syrupOptions)
        } catch {
            fatalError("menu.json file is either missing or corrupt")
        }
    }
}
