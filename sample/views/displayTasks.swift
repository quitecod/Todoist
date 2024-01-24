//
//  displayTaks.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

struct displayTasks: View {
    
    
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Not Completed")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.red)
                
                List{
                    
                    ForEach(vm.saved,id: \.self) { item in
                        if(!item.isCompleted){
                            VStack(alignment:.leading){
                                    
                                    HStack{Image(systemName: item.isCompleted ? "checkmark.circle" :"circle")
                                            .foregroundColor(item.isCompleted ? .green:.red)
                                            .onTapGesture {
                                                vm.mark(entity: item)
                                                withAnimation(.linear) {
                                                    
                                                }
                                            }
                                        
                                        
                                        Text(item.name ?? "No Name")
                                        
                                    }
                                    HStack{
                                        Text("Description:")
                                            .bold()
                                        
                                        Text(item.desc ?? "No Description")
                                        Spacer()
                                        if(!item.isCompleted){
                                            if let dd=item.date {
                                                dueDate(due:vm.formatDate(date: dd, format: "EEEE, MMM d, yyyy"))
                                            }
                                        }else{
                                            Text("Completed")
                                                .foregroundStyle(Color.green)
                                        }
                                    }
                                    
                                    
                                }
                                
                        }
                        
                        }.onDelete(perform: vm.deleteTasks)
                        
                        
                    }.listStyle(PlainListStyle())
                Text("Completed")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.green)
                List{
                    
                    ForEach(vm.saved,id: \.self) { item in
                        
                        if(item.isCompleted){
                            VStack(alignment:.leading){
                                    
                                    HStack{Image(systemName: item.isCompleted ? "checkmark.circle" :"circle")
                                            .foregroundColor(item.isCompleted ? .green:.red)
                                            .onTapGesture {
                                                vm.mark(entity: item)
                                                withAnimation(.linear) {
                                                    
                                                }
                                            }
                                        
                                        
                                        Text(item.name ?? "No Name")
                                        
                                    }
                                    HStack{
                                        Text("Description:")
                                            .bold()
                                        
                                        Text(item.desc ?? "No Description")
                                        Spacer()
                                        if(!item.isCompleted){
                                            if let dd=item.date {
                                                dueDate(due:vm.formatDate(date: dd, format: "EEEE, MMM d, yyyy"))
                                            }
                                        }else{
                                            Text("Completed")
                                                .foregroundStyle(Color.green)
                                        }
                                    }
                                    
                                    
                                }
                                
                        }
                            
                            
                        }.onDelete(perform: vm.deleteTasks)
                        
                        
                    }
                    
                }
            
            .onAppear(perform: {
                vm.fetchTasks()
            })
            .navigationTitle("To Do List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: {
                    addTask()
                }))
        }
                
            }
            
        
    }














#Preview {
    displayTasks()
}
