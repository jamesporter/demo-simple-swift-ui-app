import SwiftUI

struct ToDoItem {
    var description: String = ""
    var id: Int
    var done: Bool = false
}

class Store : ObservableObject {
    @Published var items: [ToDoItem] = []
    
    func addToDo(_ desc: String) {
        items.append(ToDoItem(description: desc, id: items.count))
        self.objectWillChange.send()
    }
    
    func toggle(id: Int) {
        if let idx = items.firstIndex(where: { i in i.id == id}) {
            items[idx].done.toggle()
            self.objectWillChange.send()
        }
    }
}
