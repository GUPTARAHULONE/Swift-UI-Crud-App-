//
//  ContentView.swift
//  TodoList
//
//  Created by Rahul Gupta on 09/02/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
               NoItemView()
                    .transition(AnyTransition.opacity)
                    .animation(.easeIn)
            } else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
          NavigationView{
            ListView()
        }
          .environmentObject(ListViewModel())
    }
}
