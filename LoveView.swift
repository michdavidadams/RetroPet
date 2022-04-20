import SwiftUI

struct LoveView: View {
    let images = ["BabyLove1", "BabyLove2", "BabyLove3", "BabyLove4", "BabyLove5"]
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
