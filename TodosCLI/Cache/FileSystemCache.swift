import Foundation

class FileSystemCache: Cache {
    var filePath: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first?.appending(path: "todos.json")
    }
    
    func save(todos: [Todo]) {
        if let path = filePath {
            do {
                let data = try JSONSerialization.data(withJSONObject: todos)
                try data.write(to: path)
            } catch {
                print("Saving todos-array failed")
                print(error)
            }
        }
    }
    
    func load() -> [Todo]? {
        if let path = filePath {
            do {
                let data = try Data(contentsOf: path)
                let todos = try JSONSerialization.jsonObject(with: data) as? [Todo]
                
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
