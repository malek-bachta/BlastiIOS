//
//  test.swift
//  Blasti
//
//  Created by Siwar Nafti on 5/4/2023.
//

import CoreFoundation
import CoreGraphics
import SwiftUI

struct AnimatedBackground: View {
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var isLoading: Bool = true
    @State private var circleOpacity: Double = 0.2
        let circleSizes: [CGFloat] = [20, 40, 60, 80, 100, 120]
        
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ForEach(circleSizes, id: \.self) { size in
                    Circle()
                        .fill(Color.black.opacity(circleOpacity))
                        .frame(width: size, height: size)
                        .scaleEffect(2.0 + CGFloat(circleOpacity))
                        .animation(Animation.linear(duration: Double
                            .random(in: 0.5...1.5)).repeatForever(autoreverses: true))
                        .onAppear {
                                    self.circleOpacity = Double.random(in: 0.1...0.5)
                                }
                Circle()
                    .fill(Color.black.opacity(circleOpacity))
                    .frame(width: size, height: size)
                    .scaleEffect(4.0 + CGFloat(circleOpacity))
                    .animation(Animation.linear(duration: Double
                        .random(in: 0.5...1.5)).repeatForever(autoreverses: true))
                    .onAppear {
                                self.circleOpacity = Double.random(in: 1.5...2.0)
                            }
                        }
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
            }
            
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: true)) {
                self.xOffset = UIScreen.main.bounds.width / 2
                self.yOffset = UIScreen.main.bounds.height / 2
            }
            // Simulate loading for 3 seconds, then stop loading and show the circles
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.isLoading = false
            }
        }
    }
}

    
    struct ContentView_Previews : PreviewProvider
    {
        static var previews: some View{
            AnimatedBackground()
        }
    }


