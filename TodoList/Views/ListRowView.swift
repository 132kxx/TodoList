//
//  ListRowView.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import SwiftUI


struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
    }
}


struct ListRowView_Previews: PreviewProvider {

    static var item1 = ItemModel(title: "firstitem", isCompleted: false)
    static var item2 = ItemModel(title: "secitem", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
