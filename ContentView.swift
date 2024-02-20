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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns : columns){
                    ForEach(missions){mission in
                        NavigationLink{
                            Text("Detail View")
                        } label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .frame(maxWidth : .infinity)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MoonShot")
            
            
        }
        
        
        
        //        VStack {
        //
        //
        //
        //            Image(.anders)
        //                .resizable()
        //                .scaledToFit()
        ////                .scaledToFill()
        //                .containerRelativeFrame(.horizontal){size, axis in size * 0.8}
        //
        ////                .clipped()
        //        }
        //    }
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
