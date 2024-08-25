import Foundation

class TodosManager {
    var todos: [Todo]
    var cache: Cache
    var chosenCache: Preference
    
    init(chosenCache: Preference = Preference.InMemoryCache) {
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
        guard index > -1, index < self.todos.count else {
            return
        }
        
        todos[index].isCompleted.toggle()
        cache.save(todos: todos)
    }
    
    func deleteTodo(atIndex index: Int) {
        guard index > -1, index < self.todos.count else {
            return
        }
        
        todos.remove(at: index)
        cache.save(todos: todos)
    }
}
