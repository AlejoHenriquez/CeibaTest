//
//  ListRouter.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserListRouter: IUserListRouter{
    
    
    class func createUserListModule(userListRef: UserListView){
        let presenter: IUserListPresenter = UserListPresenter()
        
        userListRef.presenter = presenter
        userListRef.presenter?.interactor = UserListInteractor()
        userListRef.presenter?.router = UserListRouter()
        userListRef.presenter?.view = userListRef
    }
}
