import SwiftUI

struct FoodView: View {
    
    var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.6)
                VStack {
                    NavigationLink(destination: PetEatingView(foodImages: ["Apple_1", "Apple_2", "Apple_3"])) {
                        Text("Apple")
                    }
                    .padding()
                    NavigationLink(destination: PetEatingView(foodImages: ["Pizza1", "Pizza2", "Pizza3", "Pizza4"])) {
                        Text("Pizza")
                    }
                    .padding()
                    NavigationLink(destination: PetEatingView(foodImages: ["Coffee1", "Coffee2"])) {
                        Text("Coffee")
                    }
                    .padding()
                }.foregroundColor(.black)
                
            }
            .navigationBarBackButtonHidden(false)
            .navigationBarHidden(false)
        
    }
}

struct PetEatingView: View {
    let images = ["Baby_1", "Baby_2", "Baby_3"]
    let foodImages: [String]
    @State var activeImageIndex = 0
    private let imageSwitchTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            HStack {
                Image(images[activeImageIndex])
                    .onReceive(imageSwitchTimer) { _ in
                        self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                        if activeImageIndex == foodImages.count - 1 {
                            self.imageSwitchTimer.upstream.connect().cancel()
                        }
                        }
                
                Image(foodImages[activeImageIndex])
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}
