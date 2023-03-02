//
//  ListViewModel.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import Foundation

/*
 CRUD FUNCTION
 
 Create
 Read
 Update
 Delte
 
 */


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItem()
    }
    
    func getItem() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the sec title!", isCompleted: true),
            ItemModel(title: "This is the third title!", isCompleted: false)
          ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexset: IndexSet) {
        items.remove(atOffsets: indexset)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
        
    }
}
