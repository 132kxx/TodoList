//
//  ListViewModel.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItem = [
            ItemModel(title: "i am", isCompleted: false),
            ItemModel(title: "i am iron", isCompleted: true),
            ItemModel(title: "have to check", isCompleted: false)
        ]
        
        items.append(contentsOf: newItem)
    }
    
    func deleteItem(indexset: IndexSet) {
        items.remove(atOffsets: indexset)
    }
    
    func moveItem(from: IndexSet, to: Int)  {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
}
