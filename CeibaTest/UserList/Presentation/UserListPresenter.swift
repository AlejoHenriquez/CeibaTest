//
//  ListPT.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation
import UIKit

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
    
    func didSelect(user: User, from view: UIViewController){
        router?.pushToUserDetail(with: user, from: view)
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
