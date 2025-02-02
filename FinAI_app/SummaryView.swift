import SwiftUI

struct SummaryView: View {
    @State private var isPresentingNewTransaction = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                Text("Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button(action: {
                    isPresentingNewTransaction = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)

            CardView()
                .frame(height: UIScreen.main.bounds.height / 5)
                .padding(.horizontal)

            Text("History")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            List {
                ForEach(0..<5, id: \ .self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Transaction \(index + 1)")
                                .font(.headline)
                            Text("Jan 0\(index + 1), 2024")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("$\(Int.random(in: 10...500)).00")
                            .fontWeight(.bold)
                    }
                    .padding()
                }
            }
            .listStyle(PlainListStyle())

            Spacer()
        }
        .padding(.top)
        .sheet(isPresented: $isPresentingNewTransaction) {
                    NewTransactionView()
                }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
