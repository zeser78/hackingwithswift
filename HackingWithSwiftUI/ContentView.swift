//
//  ContentView.swift
//  HackingWithSwiftUI
//
//  Created by Sergio Olivares on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationRotate = 0.0
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 1
                animationRotate += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.easeOut, value: animationAmount)
        .rotation3DEffect(.degrees(animationRotate), axis: (x: 0, y:1, z:0))
        
        LinearGradient(gradient: Gradient(colors:[.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded{_ in dragAmount = .zero}
            )
            .animation(.spring(), value: dragAmount)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
