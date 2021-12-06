//
//  UserListInteractor.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserListInteractor: IUserListInteractor{
    
    weak var presenter: IUserListInteractorOutput?
    let repository: IUserListRepo = UserListRepository()
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering = false
    
    func getUsers() {
        repository.getUsers { [weak self] users in
            guard let _ = self else{
                return
            }
            //print("users", users)
            self!.presenter?.didFetchUsers(users: users)
            self!.users = users
        }
    }
    
    func filter(_ text: String){
        if text.isEmpty{
            isFiltering = false
            return
        }
        filteredUsers = users.filter { user in
            return user.name.lowercased().contains(text.lowercased()) ?? false
        }
        isFiltering = true
        
        presenter?.didFetchUsers(users: filteredUsers)
    }
    
}

