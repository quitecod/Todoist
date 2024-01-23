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
                
                
                List{
                    
                    ForEach(vm.saved,id: \.self) { item in
                        
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
                            .font(.title2)
                            .padding(.vertical,8)
                        }.onDelete(perform: vm.deleteTasks)
                        
                        
                    }.listStyle(PlainListStyle())
                    
                }
                
                
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
