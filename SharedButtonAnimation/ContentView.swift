//
//  ContentView.swift
//  SharedButtonAnimation
//
//  Created by admin on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var step1 = false
    @State private var step2 = false
    
    var icons = ["paperplane", "swift", "bird"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(icons.indices, id: \.self) { index in
                    Image(systemName: icons[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding()
                        .scaleEffect(step2 ? 1 : 0)
                        .animation(.spring(duration: 0.5).delay(Double(index) * 0.3) , value: step2)
                }.padding()
            }
            .background(.secondary.opacity(0.4), in: RoundedRectangle(cornerRadius: 40))
            .onAppear() {
                step2.toggle()
            }
            Button("Reset") {
                step1.toggle()
                step2.toggle()
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
