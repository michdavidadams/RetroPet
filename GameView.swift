import SwiftUI

struct GameView: View {
    @State var activeImageIndex = 0
    private let imageSwitchTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var winStatus = Win.tie
    @State var petChoice = Choice.rock
    @State var humanChoice = Choice.rock
    let winImages = ["BabyWin1", "BabyWin2"]
    let loseImages = ["BabyLose1", "BabyLose2"]
    let tieImages = ["Baby_1", "Baby_2"]
    var body: some View {
        VStack {
            VStack {
                if winStatus == .win {
                    HStack {
                    Image(loseImages[activeImageIndex])
                        .onReceive(imageSwitchTimer) { _ in
                            self.activeImageIndex = (self.activeImageIndex + 1) % self.winImages.count
                        }
                        VStack {
                            Text("You won!")
                            petChoice.image()
                        }
                    }
                } else if winStatus == .lose {
                    HStack {
                    Image(winImages[activeImageIndex])
                        .onReceive(imageSwitchTimer) { _ in
                            self.activeImageIndex = (self.activeImageIndex + 1) % self.loseImages.count
                        }
                        VStack {
                            Text("You lost!")
                            petChoice.image()
                        }
                    }
                } else {
                    HStack {
                    Image(tieImages[activeImageIndex])
                        .onReceive(imageSwitchTimer) { _ in
                            self.activeImageIndex = (self.activeImageIndex + 1) % self.tieImages.count
                        }
                    VStack {
                        Text("Tie!")
                        petChoice.image()
                    }
                    }
                }
                HStack {
                Button(action: { RockPaperScissors(choice: .rock) }) {
                    Text("Rock")
                }.padding()
                Button(action: { RockPaperScissors(choice: .paper) }) {
                    Text("Paper")
                }.padding()
                Button(action: { RockPaperScissors(choice: .scissors) }) {
                    Text("Scissors")
                }.padding()
                }
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
        .navigationTitle("Rock, Paper, Scissors")
        .navigationBarTitleDisplayMode(.inline)
    }
    func RockPaperScissors(choice: Choice) {
        humanChoice = choice
        petChoice = Choice.allCases.randomElement() ?? .scissors
        if choice == .rock {
            if petChoice == .paper {
                winStatus = .lose
            } else if petChoice == .scissors {
                winStatus = .win
            } else {
                winStatus = .tie
            }
        } else if choice == .paper {
            if petChoice == .rock {
                winStatus = .win
            } else if petChoice == .scissors {
                winStatus = .lose
            } else {
                winStatus = .tie
            }
        } else if choice == .scissors {
            if petChoice == .rock {
                winStatus = .lose
            } else if petChoice == .paper {
                winStatus = .win
            } else {
                winStatus = .tie
            } 
        } else {
            winStatus = .tie
        }
    }
}

enum Win {
    case win, lose, tie
}
enum Choice: CaseIterable {
    case rock, paper, scissors
    
    func image() -> Image {
        switch self {
            case .paper:
            return Image("Paper")
            case .rock:
            return Image("Rock")
            case .scissors:
            return Image("Scissors")
        }
    }
}

