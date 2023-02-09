//
//  TodoListApp.swift
//  TodoList
//
//  Created by Rahul Gupta on 09/02/23.
//

import SwiftUI

// main here is for entry point of application
@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
