import Foundation

class InMemoryCache: Cache {
    var todos = [Todo]()
    
    func save(todos: [Todo]) -> Bool {
        self.todos = todos
        return true
    }
    
    func load() -> [Todo]? {
        return todos
    }
}
