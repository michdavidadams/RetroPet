import SwiftUI

struct SleepView: View {
    let images = ["BabySleep1", "BabySleep2", "BabySleep3"]
    @State var activeImageIndex = 0
    private let imageSwitchTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            VStack {
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "lightbulb.fill").font(Font.system(.title).bold())
                }.padding()
                Image(images[activeImageIndex])
                    .onReceive(imageSwitchTimer) { _ in
                        self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
        
    }
}
