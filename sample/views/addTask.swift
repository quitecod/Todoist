//
//  addTask.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

struct addTask: View {
    
    
    @StateObject var vm = CoreDataViewModel()
    @State private var showAlert = false
    @State var text:String = ""
    @State var desc:String = ""
    @State var selectedDate:Date = Date()
    
    var body: some View {
        VStack {
            
            ZStack {
                
                VStack(){
                    
                    Form{
                        Section("Tasks"){
                            TextField("Task Name", text: $text)
                                .font(.headline)
                            //.background(Color("Color1"))
                                .cornerRadius(10)
                            TextField("Task Description", text: $desc)
                                .font(.headline)
                            //.background(Color("Color1"))
                                .cornerRadius(10)
                        }
                        Section("Due Date"){
                            DatePicker("Select Date", selection: $selectedDate,displayedComponents: .date)
                                .datePickerStyle(.compact)
                                .padding(.horizontal)
                        }
                        Button(action: {
                            guard !text.isEmpty, !desc.isEmpty else{return}
                            
                            vm.addTasks(text: text,desc:desc,date:selectedDate)
                            showAlert=true
                            text=""
                            desc=""
                            
                        }, label: {
                            Text("Save")
                                .font(.headline)
                                .foregroundStyle(Color.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        })
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Alert ").foregroundStyle(Color.red),
                                message: Text("Record Saved")
                               )}
                        .padding()
                        Image("img")
                            .frame(width:350)
                        
                        
                    }
                    
                    Spacer()
                    
                    
                }
                .navigationBarBackButtonHidden()
                
                .navigationBarItems(leading: backButton())
                
            }
        }
    }
}



#Preview {
    addTask()
}
