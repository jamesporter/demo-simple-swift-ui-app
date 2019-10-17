import SwiftUI

struct ContentView: View {

    @State var text: String = ""
    @ObservedObject var state: Store
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("To Do Item", text: $text).padding()
                    Button(action: {
                        self.state.addItem(text: self.text)
                        self.text = ""
                    }) {
                        Text("Add").padding().background(Color.yellow).cornerRadius(8.0).padding()
                    }
                }
                List(state.items, id: \.id) { item in
                    Text(item.text).foregroundColor( item.done ? .green : .red).padding()
                    Spacer()
                    Button(action: {
                        self.state.toggleDone(id: item.id)
                    }) {
                        Text("Toggle").padding().background(Color.blue).cornerRadius(8.0).padding()
                    }
                }
            }.navigationBarTitle("To Do App")
        }
    }
}


extension View {
    func greened() -> some View {
        self.foregroundColor(.green)
    }
}





















//struct ContentView: View {
//
//    @State var text: String = ""
//    @ObservedObject var state: Store
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Item", text: $text)
//                    Button(action: {
//                        self.state.addToDo(self.text)
//                        self.text = ""
//                    }) {
//                        Text("Add")
//                    }
//                }.padding()
//                List(state.items, id: \.id) { item in
//                    HStack {
//                        Text(item.description)
//                            .foregroundColor(item.done ? .gray : .green)
//                        Spacer()
//                        Button(action: { self.state.toggle(id: item.id)
//                        }) {
//                            Text(item.done ? "Set Not Done": "Set Done").padding()
//                        }
//                    }
//                }
//            }.navigationBarTitle("To Do")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(state: Store())
    }
}
