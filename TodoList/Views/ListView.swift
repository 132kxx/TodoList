//
//  ListView.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
        
    }
    
    func deleteItem(indexset: IndexSet) {
        listViewModel.items.remove(atOffsets: indexset)
    }
    
    func moveItem(from: IndexSet, to: Int)  {
        listViewModel.items.move(fromOffsets: from, toOffset: to)
    }
    

    
}

// preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

