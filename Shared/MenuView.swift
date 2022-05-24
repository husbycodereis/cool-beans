//
//  MenuView.swift
//  CoolBeans (iOS)
//
//  Created by Ali Riza Reisoglu on 23.05.2022.
//

import SwiftUI

struct MenuView: View {
    //EnvironmentObject reads the value of a variable outside the view from somewhere else
    @EnvironmentObject var menu: Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                //pinned view stabilizes headers inside the scroll view
                LazyVGrid(columns: columns, pinnedViews:  .sectionHeaders) {
                    ForEach(menu.sections){ section in
                        Section {
                            ForEach(section.matches(for: searchText)){ drink in
                                NavigationLink {
                                    // In CustomizeView we have created a void callback that takes the dismiss() environment action in MenuView and once the CustomizeView save button is pressed, the dismiss on MenuView gets triggered
                                    CustomizeView(drink: drink) {
                                        dismiss()
                                    }
                                } label: {
                                    VStack{
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                //changes the color of navigationlink text
                                .buttonStyle(.plain)
                                
                            }
                        
                        } header: {
                            Text(section.name)
                                .font(.system(.title,design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drink")
            .searchable(text: $searchText)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
