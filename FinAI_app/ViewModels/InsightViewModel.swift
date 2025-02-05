import SwiftUI
import CoreData

class InsightsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var categoryTotals: [String: Double] = [:]
    @Published var monthlyExpenses: [(String, Double)] = []

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataManager.shared.persistentContainer.viewContext) {
        self.context = context
        fetchTransactions()
        calculateCategoryTotals()
        calculateMonthlyExpenses()
    }

    func fetchTransactions() {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        do {
            transactions = try context.fetch(request)
        } catch {
            print("Error fetching transactions: \(error)")
        }
    }

    func calculateCategoryTotals() {
        var totals: [String: Double] = [:]
        for transaction in transactions where transaction.type == "Expense" {
            let category = transaction.category ?? "Other"
            totals[category, default: 0] += transaction.amount
        }
        categoryTotals = totals
    }

    func calculateMonthlyExpenses() {
        var monthlyTotals: [String: Double] = [:]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"

        for transaction in transactions where transaction.type == "Expense" {
            let month = dateFormatter.string(from: transaction.date ?? Date())
            monthlyTotals[month, default: 0] += transaction.amount
        }

        monthlyExpenses = monthlyTotals.sorted { $0.0 < $1.0 }
    }
}
