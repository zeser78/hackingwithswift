//
//  ContentView.swift
//  HackingWithSwiftUI
//
//  Created by Sergio Olivares on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "Russia", "US", "Spain", "France", "Germany", "Italy", "Nigeria", "Poland", "UK", "Ireland"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        //        ZStack {
        //            Color.teal
        //            Color(red: 1, green: 0.8, blue: 0)
        //            Color.primary
        //                .frame(width: 200, height: 200, alignment: .center)
        //            Text("Hello, world!")
        //                .padding()
        //                .foregroundStyle(.secondary)
        //                .background(.ultraThinMaterial)
        //        }
        //        .ignoresSafeArea()
        //        RadialGradient(gradient: Gradient(colors: [.teal, .green, .yellow]), center: .center, startRadius: 100, endRadius: 200)
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.teal, .green, .indigo]), center: .center, startRadius: 100, endRadius: 200)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        // flag tapped
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                    
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ??")
        }
       
    }
    func flagTapped(_ number: Int) {
        if (number == correctAnswer) {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
