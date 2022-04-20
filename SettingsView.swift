import SwiftUI

struct SettingsView: View {
    @Binding var deviceColor: Color
    var colors: [Color] = [.blue, .cyan, .indigo, .green, .orange, .pink, .purple, .red, .yellow]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            VStack {
                Text("Change Device Color")
                    .font(.headline)
                Picker(selection: $deviceColor, label: Text("Select Device Colors")) {
                    Text("Orange").tag(Color.blue)
                    Text("Cyan").tag(Color.cyan)
                    Text("Green").tag(Color.green)
                    Text("Orange").tag(Color.orange)
                    Text("Pink").tag(Color.pink)
                    Text("Yellow").tag(Color.yellow)
                }.padding()
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
    }
}

