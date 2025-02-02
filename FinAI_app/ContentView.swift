import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }

            InsightView()
                .tabItem {
                    Label("Insight", systemImage: "lightbulb")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
