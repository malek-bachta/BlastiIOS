import SwiftUI

struct aa: View {
    @State private var shouldAnimate = false
       
       var body: some View {
           ZStack {
                      Color.black.edgesIgnoringSafeArea(.all)
                      ForEach(1...50, id: \.self) { i in
                          // Generate a random X and Y coordinate for each dot
                          let randomX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
                          let randomY = CGFloat.random(in: 0...UIScreen.main.bounds.height)
                          
                          // Create a "cool" yellow dot with a size of 20x20 pixels
                          Image(systemName: "circle.fill")
                              .resizable()
                              .foregroundColor(.yellow)
                              .frame(width: 20, height: 20)
                              .opacity(0.8)
                              .blur(radius: 2)
                              .overlay(
                                  Circle()
                                      .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                      .foregroundColor(.white)
                              )
                              .rotationEffect(.degrees(Double.random(in: 0...360)))
                              .position(x: randomX, y: shouldAnimate ? randomY : UIScreen.main.bounds.height + 20)
                              .scaleEffect(CGFloat.random(in: 0.5...1.5))
                              .animation(Animation.easeOut(duration: Double.random(in: 0.5...2)).repeatForever(autoreverses: true).delay(Double.random(in: 0...2)))
                      }
                  }
                  .onAppear {
                      shouldAnimate = true
                  }
              }
          }
struct aa_Previews: PreviewProvider {
    static var previews: some View {
        aa()
    }
}
