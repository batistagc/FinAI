import CoreML

class TransactionClassifier {
    let model: TransactionClassifierModel

    init() {
        do {
            model = try TransactionClassifierModel(configuration: MLModelConfiguration())
        } catch {
            fatalError("Error loading the model: \(error)")
        }
    }

    func classifyTransaction(description: String) -> String? {
        do {
            let prediction = try model.prediction(text: description)
            return prediction.label
        } catch {
            print("Error classifying transaction: \(error)")
            return nil
        }
    }
}

