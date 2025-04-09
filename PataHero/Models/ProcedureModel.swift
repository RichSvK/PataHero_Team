import Foundation

// Model untuk step prosedur
struct FractureProcedure: Identifiable {
    var id: UUID = UUID()
    var step: String
    var imagePath: String
    let progressLabel: String?
}
