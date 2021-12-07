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
        print(#function)
        repository.getUsers(from: .Local) { [weak self] users in
            guard let _ = self else{
                return
            }
            if users.count > 0 {
                self!.didFetchUsers(users: users)
            }else{
                self!.getUsersAPI()
            }
        }
    }
    
    private func getUsersAPI(){
        print(#function)
        repository.getUsers(from: .API) { [weak self] users in
            guard let _ = self else{
                return
            }
            if users.count > 0 {
                self!.repository.saveLocalUsers(users: users)
            }
            
            self!.didFetchUsers(users: users)
        }
    }
    
    private func didFetchUsers(users: [User]){
        presenter?.didFetchUsers(users: users)
        self.users = users
    }
    
    func filter(_ text: String){
        if text.isEmpty{
            isFiltering = false
            presenter?.didFetchUsers(users: users)
            return
        }
        filteredUsers = users.filter { user in
            return user.name.lowercased().contains(text.lowercased())
        }
        isFiltering = true
        
        presenter?.didFetchUsers(users: filteredUsers)
    }
    
}

