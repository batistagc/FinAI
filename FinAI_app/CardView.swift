import SwiftUI

struct CardView: View {
    var totalIncomes: Double
    var totalOutcomes: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 4)

            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 32) {
                    VStack {
                        Text("Incomes")
                            .font(.headline)
                            .foregroundColor(.green)
                        Text("$\(totalIncomes, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.bold)
                    }

                    VStack {
                        Text("Expenses")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text("$\(totalOutcomes, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .padding()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(totalIncomes: 0.00, totalOutcomes: 0.00)
    }
}
