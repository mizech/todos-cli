import Foundation

class TodosManager {
    var todos = [Todo]()
    
    func add(title: String) {
        todos.append(Todo(title: title))
    }
    
    func list() {
        print("Your Todos: ")
        for (i, todo) in todos.enumerated() {
            print("\(i + 1). \(todo.title)")
        }
    }
    
    func toggle() {
        
    }
    
    func delete(index: Int) {
        todos.remove(at: index)
    }
    
    func exit() {
        
    }
}
