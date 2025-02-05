import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    init() {
        self.persistentContainer = NSPersistentContainer(name: "FinanceModel")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading persistent stores: \(error)")
            }
        }
    }
}
