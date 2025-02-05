import SwiftUI

struct InsightCard<Content: View>: View {
    let title: String
    let insight: String
    let content: Content

    init(title: String, insight: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.insight = insight
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)

            content
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(insight)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
