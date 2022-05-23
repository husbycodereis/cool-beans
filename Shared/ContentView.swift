//
//  ContentView.swift
//  Shared
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import SwiftUI
//StateObject means the data is created and used inside the view and keeps the variable alive in the view

struct ContentView: View {
    @StateObject var menu = Menu()
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
