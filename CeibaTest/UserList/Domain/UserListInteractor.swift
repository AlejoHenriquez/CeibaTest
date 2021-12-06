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
    
    func getUsers() {
        repository.getUsers { [weak self] users in
            guard let _ = self else{
                return
            }
            print("users", users)
            self!.presenter?.didFetchUsers(users: users)
        }
    }
}

