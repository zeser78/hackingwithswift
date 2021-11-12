//
//  Bundle-Decodable.swift
//  moonShot
//
//  Created by Sergio Olivares on 11/12/21.
//

import Foundation
extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load  \(file) in bundle")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Fail to decode \(file) in bundle")
        }

        return loaded
    }
}
