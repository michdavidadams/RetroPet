import SwiftUI

struct HealthView: View {
    @State var petHealth = Health.allCases.randomElement()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            HStack {
                petHealth?.image()
                VStack {
                    if petHealth == .sick {
                        Text("Pet is sick.")
                        Image("ThumbsDown")
                    } else {
                        Text("Pet is healthy.")
                        Image("ThumbsUp")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}

enum Health: CaseIterable {
    case healthy, sick
    func image() -> Image {
        switch self {
            case .healthy:
            return Image("Baby_1")
            case .sick:
            return Image("BabyLose1")
        }
    }
}
