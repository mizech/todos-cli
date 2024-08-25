import Foundation

class InMemoryCache: Cache {
    var todos = [Todo]()
    
    func save(todos: [Todo]) {
        self.todos = todos
    }
    
    func load() -> [Todo]? {
        return todos
    }
}
