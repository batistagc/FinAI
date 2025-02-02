import SwiftUI

struct NewTransactionView: View {
    @State private var title = ""
    @State private var amount = ""
    @State private var type = "Income"
    @State private var category = ""
    @State private var date = Date()

    let categories = ["Food", "Entertainment", "Shopping", "Transport", "Others"]

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
                        ForEach(categories, id: \ .self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                }

                DatePicker("Date", selection: $date, displayedComponents: .date)
                    .padding()

                Button(action: {
                    // Save action here
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
            .navigationBarItems(trailing: Button("Close") {
                // Dismiss action here
            })
        }
    }
}

struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView()
    }
}
