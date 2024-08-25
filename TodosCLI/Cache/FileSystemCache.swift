import Foundation

class FileSystemCache: Cache {
    var filePath: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first?.appending(path: "todos.json")
    }
    
    func save(todos: [Todo]) -> Bool {
        if let path = filePath {
            do {
                let json = try JSONEncoder().encode(todos)
                try json.write(to: path)
                return true
            } catch {
                print("Saving todos-array failed")
                print(error)
                return false
            }
        }
        return false
    }
    
    func load() -> [Todo]? {
        if let path = filePath {
            do {
                let data = try Data(contentsOf: path)
                let todos = try JSONDecoder().decode([Todo].self, from: data)
                
                guard todos != nil else {
                    return []
                }
                return todos
            } catch {
                print("Saving todos-array failed")
                print(error)
            }
        }
        
        return []
    }
}
