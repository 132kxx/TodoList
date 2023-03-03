//
//  ListViewModel.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItem = [
//            ItemModel(title: "i am", isCompleted: false),
//            ItemModel(title: "i am iron", isCompleted: true),
//            ItemModel(title: "have to check", isCompleted: false)
//        ]
//
//        items.append(contentsOf: newItem)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItem
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
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
