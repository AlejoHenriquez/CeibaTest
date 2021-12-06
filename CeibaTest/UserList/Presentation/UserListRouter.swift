//
//  ListRouter.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation
import UIKit

class UserListRouter: IUserListRouter{
    
    class func createUserListModule(userListRef: UserListView){
        let presenter: IUserListPresenter & IUserListInteractorOutput = UserListPresenter()
        
        userListRef.presenter = presenter
        userListRef.presenter?.interactor = UserListInteractor()
        userListRef.presenter?.interactor?.presenter = presenter
        userListRef.presenter?.router = UserListRouter()
        userListRef.presenter?.view = userListRef
    }
    
    func pushToUserDetail(with user: User, from view: UIViewController){
        let vc = view.storyboard?.instantiateViewController(identifier: "UserDetailVC") as! UserDetailView
        UserDetailRouter.createUserDetailModule(with: vc, user: user)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
