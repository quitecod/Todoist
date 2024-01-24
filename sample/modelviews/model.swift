//
//  model.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import Foundation
import CoreData

class CoreDataViewModel:ObservableObject{
    let container:NSPersistentContainer
    @Published var saved:[TaskEntity]=[]
    init(){
        container=NSPersistentContainer(name: "Task")
        container.loadPersistentStores { description, error in
            if let error=error{
                print("ERROR LOADING CORE DATA.\(error)")
            }else{
                print("Successfully loaded core data!")
            }
        }
        fetchTasks()
    }
    func fetchTasks(){
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        do{
            saved = try container.viewContext.fetch(request)
        }catch {
            print("Eroor in fetching the request")
        }
        
    }
    func mark(entity:TaskEntity){
        entity.isCompleted = !entity.isCompleted
        saveTasks()
        
    }
    func addTasks(text:String,desc:String,date:Date){
        
        let item=TaskEntity(context: container.viewContext)
        item.name=text
        item.desc=desc
        item.date=date
        //item.isCompleted=false
        saveTasks()
    }
    
    func deleteTasks(indexSet:IndexSet){
        guard let index = indexSet.first else{return}
        let entity=saved[index]
        container.viewContext.delete(entity)
        saveTasks()
    }
    func saveTasks(){
        do{
            try container.viewContext.save()
            fetchTasks()
        }catch {
            print("Error in saving")
        }
        
    }
    
    func formatDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}
