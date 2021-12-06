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
    
    func filter(_ text: String){
        interactor?.filter(text)
    }
}


extension UserListPresenter: IUserListInteractorOutput{
    func didFetchUsers(users: [User]) {
        view!.hideSpinner()
        view!.showUsers(users: users)
        if users.count == 0{
            view!.showEmptyLabel()
        }else{
            view!.hideEmptyLabel()
        }
    }
}
