import SwiftUI

struct ContentView: View {
    @State var activeImageIndex = 0
    let imageSwitchTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    let images = ["Baby_1", "Baby_2", "Baby_3"]
    
    @State var deviceColor: Color = .cyan
    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(deviceColor)
                .frame(width: 500, height: 600)
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                NavigationView {
                    VStack {
                        HStack {
                            NavigationLink(destination: FoodView()) {
                                Image(systemName: "fork.knife").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                                
                            NavigationLink(destination: GameView()) {
                                Image(systemName: "gamecontroller.fill").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                            NavigationLink(destination: LoveView()) {
                                Image(systemName: "heart.fill").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                            NavigationLink(destination: SleepView()) {
                                Image(systemName: "lightbulb.fill").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                        }.padding(.top)
                            .navigationBarHidden(true)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.6)
                            Image(images[activeImageIndex])
                                .onReceive(imageSwitchTimer) { _ in
                                    self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                                }
                        }
                        .navigationBarHidden(true)
                        
                        HStack {
                            NavigationLink(destination: CleanView()) {
                                Image(systemName: "sparkles").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                            NavigationLink(destination: HealView()) {
                                Image(systemName: "bandage.fill").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                            NavigationLink(destination: HealthView()) {
                                Image(systemName: "waveform.path.ecg").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                            NavigationLink(destination: SettingsView(deviceColor: $deviceColor)) {
                                Image(systemName: "gearshape.fill").font(Font.system(.title).bold())
                            }.padding(.horizontal)
                        }.padding(.bottom)
                            .navigationBarHidden(true)
                    }
                }
                .navigationViewStyle(.stack)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            .frame(width: 300, height: 320)
            .foregroundColor(.black)
            .background(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .preferredColorScheme(.light)
    }
}
