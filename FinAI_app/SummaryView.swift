import SwiftUI

struct SummaryView: View {
    @StateObject private var viewModel = TransactionViewModel()
    @State private var isPresentingNewTransaction = false

    var body: some View {
           VStack(alignment: .leading, spacing: 16) {
               HStack {
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

               CardView(totalIncomes: viewModel.totalIncomes, totalOutcomes: viewModel.totalOutcomes)
                   .frame(height: UIScreen.main.bounds.height / 5)
                   .padding(.horizontal)

               Text("History")
                   .font(.title2)
                   .fontWeight(.bold)
                   .padding(.horizontal)

               List(viewModel.transactions) { transaction in
                   HStack {
                       VStack(alignment: .leading) {
                           Text(transaction.title ?? "Unknown")
                               .font(.headline)
                           Text(transaction.date ?? Date(), style: .date)
                               .font(.subheadline)
                               .foregroundColor(.gray)
                       }
                       Spacer()
                       Text("$\(transaction.amount, specifier: "%.2f")")
                           .fontWeight(.bold)
                   }
                   .padding()
               }
               .listStyle(PlainListStyle())

               Spacer()
           }
           .padding(.top)
           .sheet(isPresented: $isPresentingNewTransaction) {
               NewTransactionView(viewModel: viewModel)
           }
       }
   }

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
