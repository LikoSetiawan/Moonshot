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
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(0..<1000) { number in
                        Text("Item \(number)")
                    }
                }
            }
//            List(0..<5) { row in
//                    NavigationLink("Row \(row)") {
//                        Text("Detail \(row)")
//                    }
//                }
//                .navigationTitle("SwiftUI")
            
            Button("Decode JSON"){
                let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor swift avenue",
                    "city": "Nashville"
                }
            }
            """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: data){
                    print(user.address.street)
                    print(user.address.city)
                    print(user.name)
                }
            }
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
