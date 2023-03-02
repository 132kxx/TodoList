//
//  ItemModel.swift
//  TodoList
//
//  Created by kxx: on 2023/03/02.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool

}
