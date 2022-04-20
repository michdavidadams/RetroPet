import SwiftUI

struct HealView: View {
    let images = ["BabyHeal1", "BabyHeal2", "BabyHeal3", "BabyHeal4"]
    @State var activeImageIndex = 0
    private let imageSwitchTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            Image(images[activeImageIndex])
                .onReceive(imageSwitchTimer) { _ in
                    self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                }
            
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}
