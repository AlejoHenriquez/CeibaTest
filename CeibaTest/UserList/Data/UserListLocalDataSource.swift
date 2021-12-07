//
//  UserListLocalDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 6/12/21.
//

import Foundation
import CoreData
import UIKit

class UserListLocalDataSource: IUserListLocalDataSource{
    
    func getUsers(handler: @escaping ([UserModel]) -> Void) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let context = delegate.persistentContainer.viewContext
            
            do{
                let usersCoreData: [UserCoreData] = try context.fetch(UserCoreData.fetchRequest())
                
                var users = [UserModel]()
                
                for userCoreData in usersCoreData {
                    print(userCoreData)
                    print(userCoreData.email)
                    let user = UserModel(email: userCoreData.email!, id: Int(userCoreData.id), name: userCoreData.name!, phone: userCoreData.phone!, username: userCoreData.username!, website: userCoreData.website!)
                    users.append(user)
                }
                handler(users)
                return
            }catch{
                print(error)
            }
        }
        
        handler([])
    }
    
    func saveUsers(users: [User]){
        print(#function)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let context = delegate.persistentContainer.viewContext
            
            var usersCoreData = [UserCoreData]()
            for user in users{
                let userCoreData = createUserCoreData(from: user, with: context)
                usersCoreData.append(userCoreData)
            }
            
            delegate.saveContext()
        }
    }
    
    private func createUserCoreData(from user: User, with context: NSManagedObjectContext) -> UserCoreData{
        let userCoreData = UserCoreData(context: context)
        userCoreData.phone = user.phone
        userCoreData.email = user.email
        userCoreData.name = user.name
        userCoreData.id = Int64(user.id)
        userCoreData.website = user.website
        userCoreData.username = user.username
        
        return userCoreData
    }
    
}
