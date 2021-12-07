//
//  UserListRepository.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserListRepository: IUserListRepo{
    
    let apiDataSource : IUserListDataSource = UserListAPIDataSource()
    let localDataSource : IUserListLocalDataSource = UserListLocalDataSource()
    
    func getUsers(from sourceData: SourceData, handler: @escaping ([User]) -> ()){
        getUsers(from: getDataSource(for: sourceData), handler: handler)
    }
    
    private func getUsers(from source: IUserListDataSource, handler: @escaping ([User]) -> ()){
        source.getUsers { userModels in
            print(userModels)
            
            var users = [User]()
            for user in userModels {
                users.append(user.getUser())
            }
            handler(users)
        }
    }
    
    // Hay formas mas fancy de hacer esto :)
    private func getDataSource(for sourceData: SourceData) -> IUserListDataSource{
        switch sourceData {
        case .API:
            return apiDataSource
        case .Local:
            return localDataSource
        }
    }
    
    func saveLocalUsers(users: [User]){
        localDataSource.saveUsers(users: users)
    }
}
