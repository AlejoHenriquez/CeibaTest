//
//  ListCT.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation


protocol IUserListPresenter{
    var interactor: IUserListInteractor? {get set}
    var view: IUserListView? {get set}
    var router: IUserListRouter? {get set}
    
    func didLoad()
    func filter(_ text: String)
}

protocol IUserListView: AnyObject{
    func showSpinner()
    func hideSpinner()
    
    func showUsers(users: [User])
    func showEmptyLabel()
    func hideEmptyLabel()
}

protocol IUserListInteractor{
    var presenter: IUserListInteractorOutput? {get set}
    
    func getUsers()
    func filter(_ text: String)
}

protocol IUserListInteractorOutput: AnyObject{
    func didFetchUsers(users: [User])
}

protocol IUserListRouter{
    static func createUserListModule(userListRef: UserListView)
}

