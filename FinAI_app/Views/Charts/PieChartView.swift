import SwiftUI
import Charts

struct PieChartView: View {
    let data: [String: Double]

    var body: some View {
        Chart {
            ForEach(data.keys.sorted(), id: \ .self) { key in
                SectorMark(angle: .value("Gasto", data[key] ?? 0), innerRadius: .ratio(0.5))
                    .foregroundStyle(by: .value("Categoria", key))
            }
        }
        .chartLegend(.visible)
    }
}
