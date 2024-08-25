import Foundation

struct Todo: CustomStringConvertible, Codable {
    let id = UUID()
    var title: String
    var isCompleted = false
    
    var description: String {
        "Todo-title: '\(title)', isCompleted: \(isCompleted)"
    }
}
