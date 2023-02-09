//
//  ItemModel.swift
//  TodoList
//
//  Created by Rahul Gupta on 09/02/23.
//

import Foundation


// Identifiable is used here , so that we can use item =model in for each
// codable , used so that it can be decoded and encoded
struct ItemModel: Identifiable,Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
