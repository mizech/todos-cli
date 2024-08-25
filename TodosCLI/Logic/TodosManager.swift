import Foundation

class TodosManager {
    var todos: [Todo]
    var cache: Cache
    var chosenCache: Preference
    
    init(chosenCache: Preference = Preference.FileSystemCache) {
        self.chosenCache = chosenCache
        switch self.chosenCache {
            case .FileSystemCache:
                self.cache = FileSystemCache()
            case .InMemoryCache:
                self.cache = InMemoryCache()
        }
        self.todos = self.cache.load() ?? []
    }
    
    func addTodo(with title: String) {
        todos.append(Todo(title: title))
        cache.save(todos: todos)
    }
    
    func listTodos() {
        for (i, todo) in todos.enumerated() {
            print("\(i + 1). \(todo.isCompleted == true ? "✅" : "❌") \(todo.title)")
        }
    }
    
    func toggleCompletion(forTodoAtIndex index: Int) {
        todos[index].isCompleted.toggle()
        cache.save(todos: todos)
    }
    
    func deleteTodo(atIndex index: Int) {
        todos.remove(at: index)
        cache.save(todos: todos)
    }
    
    func exit() {
        
    }
}
