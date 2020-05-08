//
//  ContentView.swift
//  Transitions
//
//  Created by Javier Fernández on 07/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNewCard = false
    
    var body: some View {
        VStack {
            Text("Transitions")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 200)
                .foregroundColor(!isNewCard ? Color.blue : Color.red)
                .overlay(
                    Text(!isNewCard ? "Tap Add card" : "Remove card")
                        .foregroundColor(.white)
                        .font(.system(.largeTitle, design: .default))
                        .multilineTextAlignment(.center)
                )
            if self.isNewCard {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 200)
                    .foregroundColor(.orange)
                    .overlay(
                        Text("New card")
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .default))
                    )
                    //.transition(.scale) // System Transition
                    //.transition(.scaleOffsetOpacity) // Own Transition
                    .transition(.asymmetric(insertion: .slide,
                                            removal: .offset(x: 600, y: 50))
                    )
            }
        }.onTapGesture {
            withAnimation(Animation.spring()) {
                self.isNewCard.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var scaleOffsetOpacity: AnyTransition {
        AnyTransition
            .scale(scale: 0, anchor: .bottom)
            .combined(with: .offset(x: -600, y: 0))
            .combined(with: .opacity)
    }
}
