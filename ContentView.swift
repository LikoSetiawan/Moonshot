//
//  ContentView.swift
//  Moonshot
//
//  Created by Liko Setiawan on 18/02/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group{
                if showingGrid{
                    GridView(missions: missions, astronauts: astronauts)
                }else{
                    ListView(missions: missions, astronauts: astronauts)
                }
            }
            .toolbar{
                Button{
                    showingGrid.toggle()
                } label: {
                    if showingGrid{
                        Label("Show as table", systemImage: "list.dash")
                    }else{
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }

    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

#Preview {
    ContentView()
}
