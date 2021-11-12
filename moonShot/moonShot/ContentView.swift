//
//  ContentView.swift
//  moonShot
//
//  Created by Sergio Olivares on 11/12/21.
//

import SwiftUI
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}


struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
