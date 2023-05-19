import SwiftUI

struct favorites: View {
    let gridItems = Array(1...9) // Change the range and number of items as per your requirements
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set black background
            
            VStack {
                Text("Grid View Example")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: createGridColumns(), spacing: 16) {
                        ForEach(gridItems, id: \.self) { item in
                            Text("\(item)")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    // Helper function to create grid columns
    func createGridColumns() -> [GridItem] {
        let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16), count: 3)
        return columns
    }
}

struct favView_Previews: PreviewProvider {
    static var previews: some View {
        favorites()
    }
}
