import SwiftUI

struct CardView: View {
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
                        Text("$5,000.00")
                            .font(.title2)
                            .fontWeight(.bold)
                    }

                    VStack {
                        Text("Outcomes")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text("$3,200.00")
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
        CardView()
    }
}
