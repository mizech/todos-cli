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
    
    func run() {
        print("Welcome to the Todo CLI!")
        while true {
            print("What would you like to do? (add, list, toggle, delete, exit): ")
            let answer = readLine()
            if let answer = answer {
                switch answer {
                    case Command.add.rawValue:
                        print("Enter todo-title: ")
                        let title = readLine()
                        
                        if let title = title {
                            todosManager.add(title: title)
                            print("Todo added!")
                        }
                    case Command.list.rawValue:
                        todosManager.list()
                    case Command.toggle.rawValue:
                        print("Toggle")
                    case Command.delete.rawValue:
                        print("Delete")
                    case Command.exit.rawValue:
                        print("Thanks for using Todos-CLI! See you next time!")
                        break
                    default:
                        break
                }
            } else {
                print("Option doesn't exist.")
            }
        }
    }
}
