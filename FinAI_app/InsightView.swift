import SwiftUI

struct InsightsView: View {
    @StateObject private var viewModel = InsightsViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text("Analytics")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                InsightCard(title: "Gastos por Categoria", insight: "Veja a distribuição dos seus gastos.") {
                    PieChartView(data: viewModel.categoryTotals)
                }

                InsightCard(title: "Gastos Mensais", insight: "Compare seus gastos ao longo dos meses.") {
                    LineChartView(data: viewModel.monthlyExpenses)
                }
            }
            .padding()
        }
    }
}

struct InsightView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
