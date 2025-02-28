import CoreData
import Combine

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    private let context: NSManagedObjectContext
    private let classifier = TransactionClassifier()

    init(context: NSManagedObjectContext = CoreDataManager.shared.persistentContainer.viewContext) {
        self.context = context
        fetchTransactions()
    }

    func fetchTransactions() {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        do {
            transactions = try context.fetch(request)
        } catch {
            print("Error fetching transactions: \(error)")
        }
    }

    func addTransaction(title: String, amount: Double, type: String, category: String?, date: Date) {
        let newTransaction = Transaction(context: context)
        newTransaction.id = UUID()
        newTransaction.title = title
        newTransaction.amount = amount
        newTransaction.type = type
        newTransaction.date = date

        if type.lowercased() == "expense" && category == nil {
            newTransaction.category = TransactionClassifier.shared.classifyTransaction(description: title)
        } else {
            newTransaction.category = category
        }

        saveContext()
        fetchTransactions()
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving transaction: \(error)")
        }
    }

    func updateCategory(for transaction: Transaction, newCategory: String) {
        transaction.category = newCategory
        saveContext()
        fetchTransactions()
    }

    var totalIncomes: Double {
        transactions.filter { $0.type == "Income" }.reduce(0) { $0 + $1.amount }
    }

    var totalOutcomes: Double {
        transactions.filter { $0.type == "Expense" }.reduce(0) { $0 + $1.amount }
    }
}
