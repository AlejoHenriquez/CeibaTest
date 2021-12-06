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
}

protocol IUserListView: AnyObject{
    
}

protocol IUserListInteractor{
    
}

protocol IUserListRouter{
    static func createUserListModule(userListRef: UserListView)
}

