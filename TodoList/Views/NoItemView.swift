//
//  NoItemView.swift
//  TodoList
//
//  Created by Rahul Gupta on 09/02/23.
//

import SwiftUI

struct NoItemView: View {
    
   @State var animate = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("Hii, There is no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Add items by clikcing add button on the top bar to the items!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add SOMETHING")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 30 : 10
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5
        ) {
            withAnimation(
               Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
