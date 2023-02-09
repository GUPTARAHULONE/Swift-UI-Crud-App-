//
//  ListViewModel.swift
//  TodoList
//
//  Created by Rahul Gupta on 09/02/23.
//

import Foundation

class ListViewModel: ObservableObject{
    
    // did set will be called when items changed
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is 1st item!", isCompleted: false),
//            ItemModel(title: "This is 2nd item!", isCompleted: true),
//            ItemModel(title: "This is 3rd item!", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
//
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        // same code as below as more simplified
        
//       if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//       } {
//
//       }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
