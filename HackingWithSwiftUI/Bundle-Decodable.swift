//
//  Bundle-Decodable.swift
//  HackingWithSwiftUI
//
//  Created by Sergio Olivares on 11/11/21.
//

import Foundation

//extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Fail to locate \(file) in bundle")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Fail to load  \(file) in bundle")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Fail to decode \(file) in bundle")
//        }
//
//        return loaded
//    }
//}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

