//
//  UserListRepository.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserListRepository: IUserListRepo{
    
    let dataSource : IUserListDataSource = UserListAPIDataSource()
    
    func getUsers(handler: @escaping ([User]) -> ()){
        dataSource.getUsers { userModels in
            print(userModels)
            
            var users = [User]()
            for user in userModels {
                users.append(user.getUser())
            }
            handler(users)
        }
    }
}
