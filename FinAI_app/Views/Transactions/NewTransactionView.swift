import SwiftUI

struct NewTransactionView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @State private var title = ""
    @State private var amount = ""
    @State private var type = "Income"
    @State private var category = ""
    @State private var date = Date()

    let categories = ["Food", "Transport", "Health", "Entertainment", "Home", "Trip", "Education", "Shopping", "Signatures", "Others"]

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Type", selection: $type) {
                    Text("Income").tag("Income")
                    Text("Expense").tag("Expense")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if type == "Expense" {
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                    }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                }

                DatePicker("Date", selection: $date, displayedComponents: .date)
                    .padding()

                Button(action: {
                    if let amountValue = Double(amount) {
                        viewModel.addTransaction(title: title, amount: amountValue, type: type, category: category, date: date)
                    }
                }) {
                    Text("Add")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("New Transaction")
            .navigationBarItems(trailing: Button("Close") {})
        }
    }
}
//
//struct NewTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTransactionView(viewModel: TransactionViewModel(), title: "Uber", amount: "40.0", type: "Income", category: "Transport", date: Date(01/2025))
//    }
//}
