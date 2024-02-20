//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Liko Setiawan on 20/02/24.
//

import Foundation

extension Bundle{
    //adding < T: Codable> to make it use on any data
    func decode<T: Codable>(_ file: String)-> T{
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Failed to locate \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
