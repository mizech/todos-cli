import Foundation

class App {
    let todosManager = TodosManager()
    
    enum Command: String {
        case add = "add"
        case list = "list"
        case toggle = "toggle"
        case delete = "delete"
        case exit = "exit"
    }
    
    func requestNumber(operation: String) -> Int {
        print("Enter the number of the todo to \(operation): ")
        let oNumb = readLine()
        
        if let sNumb = oNumb {
            let iNumb = Int(sNumb) ?? -1
            guard iNumb != -1 else {
                return -1
            }
            return iNumb
        }
        
        return -1
    }
    
    func run() {
        print(" 🌟 Welcome to the Todo CLI! 🌟 ")
        while true {
            print("What would you like to do? (add, list, toggle, delete, exit): ")
            let answer = readLine()
            if let answer = answer?.trimmingCharacters(in: .whitespacesAndNewlines) {
                switch answer {
                    case Command.add.rawValue:
                        print("📌 Enter todo-title: ")
                        let title = readLine()
                        
                        if let title = title {
                            todosManager.addTodo(with: title)
                            print("Todo added!")
                        }
                    case Command.list.rawValue:
                        print("📝 Your Todos: ")
                        todosManager.listTodos()
                    case Command.toggle.rawValue:
                        todosManager.listTodos()
                        let numb = requestNumber(operation: "toggle")
                        if numb != -1 {
                            todosManager.toggleCompletion(forTodoAtIndex: numb - 1)
                        }
                    case Command.delete.rawValue:
                        todosManager.listTodos()
                        let numb = requestNumber(operation: "delete 🗑️")
                        if numb != -1 {
                            todosManager.deleteTodo(atIndex: numb - 1)
                        }
                    case Command.exit.rawValue:
                        todosManager.exit()
                    default:
                        print("❗Option doesn't exist.")
                        break
                }
            } else {
                print("❗ Option doesn't exist.")
            }
        }
    }
}
