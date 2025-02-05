import SwiftUI
import Charts

struct LineChartView: View {
    let data: [(String, Double)]

    var body: some View {
        Chart {
            ForEach(data, id: \ .0) { month, value in
                LineMark(x: .value("Mês", month), y: .value("Gasto", value))
                    .foregroundStyle(.blue)
                    .interpolationMethod(.catmullRom)
            }
        }
    }
}
