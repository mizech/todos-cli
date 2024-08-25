import Foundation

protocol Cache {
    func save(todos: [Todo])
    func load() -> [Todo]?
}
