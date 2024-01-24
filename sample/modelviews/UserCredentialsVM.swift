//
//  UserCredentialsVM.swift
//  sample
//
//  Created by Singh, Balwant on 24/01/24.
//

import Foundation
import CoreData


class UserCredentialsEntity: NSManagedObject {
    @NSManaged var username: String
    @NSManaged var password: String
}



class UserCredentialsVM: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedUserCredentials: [UserCredentialsEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "User")

        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA.\(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchUserCredentials()
    }

    func fetchUserCredentials() {
        let request = NSFetchRequest<UserCredentialsEntity>(entityName: "UserCredentialsEntity")
        do {
            savedUserCredentials = try container.viewContext.fetch(request)
            print("Fetched user credentials successfully. Count: \(savedUserCredentials.count)")
        } catch let fetchError {
            print("Error in fetching user credentials: \(fetchError.localizedDescription)")
        }
    }

    func saveUserCredentials(username: String, password: String) {
        let newUserCredentials = UserCredentialsEntity(context: container.viewContext)
        newUserCredentials.username = username
        newUserCredentials.password = password

        do {
            try container.viewContext.save()
            print("saved to coredata")
            fetchUserCredentials()
        } catch {
            print("Error in saving user credentials")
        }
    }

    func validateUserCredentials(username: String, password: String) -> Bool {
        
        
//      saveUserCredentials(username: "ballu", password: "don")
        let matchingCredentials = savedUserCredentials.filter { $0.username == username && $0.password == password }

                return !matchingCredentials.isEmpty
    
    }
}
