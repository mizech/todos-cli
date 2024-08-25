import Foundation

class TodosManager {
    var todos = [Todo]()
    
    func add(title: String) {
        todos.append(Todo(title: title))
    }
    
    func list() {
        print("Your Todos: ")
        for (i, todo) in todos.enumerated() {
            print("\(i + 1). \(todo.isCompleted == true ? "✅" : "❌") \(todo.title)")
        }
    }
    
    func toggle(number: Int) {
        todos[number - 1].isCompleted.toggle()
    }
    
    func delete(number: Int) {
        todos.remove(at: number - 1)
    }
    
    func exit() {
        
    }
}
