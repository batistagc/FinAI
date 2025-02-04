import CoreML

class TransactionClassifier {
    static let shared = TransactionClassifier()
    private var model: TransactionClassifierModel?

    init() {
        loadModel()
    }

    private func loadModel() {
        do {
            let config = MLModelConfiguration()
            model = try TransactionClassifierModel(configuration: config)
        } catch {
            fatalError("Error loading the model: \(error)")
        }
    }

    func classifyTransaction(description: String) -> String? {
        guard let model = model else { return "Unknown"}
        do {
                    let input = TransactionClassifierModelInput(text: description)

                    let prediction = try model.prediction(input: input)

                    return prediction.label
                } catch {
                    print("Erro ao prever categoria: \(error)")
                    return nil
                }
    }
}

