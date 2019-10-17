import SwiftUI



// 1. struct ToDoItem {

struct ToDoItem {
    var text: String
    var id: Int
    var done: Bool = false
}

//let item = ToDoItem(text: "do demo", id: 1)




// 2. class Store : ObservableObject {

class Store : ObservableObject {
    @Published var items: [ToDoItem] = []
    
    func addItem(text: String) {
        items.append(ToDoItem(text: text, id: items.count))
        self.objectWillChange.send()
    }
    
    func toggleDone(id: Int) {
        if let idx = items.firstIndex(where: { it in
            it.id == id
            }) {
            items[idx].done.toggle()
        }
        self.objectWillChange.send()
    }
}



















//struct ToDoItem {
//    var description: String = ""
//    var id: Int
//    var done: Bool = false
//}
//





//class Store : ObservableObject {
//    @Published var items: [ToDoItem] = []
//
//    func addToDo(_ desc: String) {
//        items.append(ToDoItem(description: desc, id: items.count))
//        self.objectWillChange.send()
//    }
//
//    func toggle(id: Int) {
//        if let idx = items.firstIndex(where: { i in i.id == id}) {
//            items[idx].done.toggle()
//            self.objectWillChange.send()
//        }
//    }
//}
