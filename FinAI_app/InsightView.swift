import SwiftUI

struct InsightView: View {
    var body: some View {
        Color(
            [.red, .blue, .green, .yellow, .purple, .orange].randomElement() ?? .gray
        )
        .ignoresSafeArea()
    }
}

struct InsightView_Previews: PreviewProvider {
    static var previews: some View {
        InsightView()
    }
}
