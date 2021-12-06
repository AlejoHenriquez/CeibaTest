//
//  ListPT.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserListPresenter: IUserListPresenter{
    
    var router: IUserListRouter?
    var interactor: IUserListInteractor?
    weak var view: IUserListView?
    
    func didLoad() {
        interactor!.getUsers()
        view!.showSpinner()
    }
}


extension UserListPresenter: IUserListInteractorOutput{
    func didFetchUsers(users: [User]) {
        view!.hideSpinner()
        view!.showUsers(users: users)
    }
}
