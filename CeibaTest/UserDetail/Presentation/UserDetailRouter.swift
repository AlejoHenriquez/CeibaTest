//
//  ListRouter.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailRouter: IUserDetailRouter{
    
    
    class func createUserDetailModule(with userDetailRef: UserDetailView, user: User){
        let presenter: IUserDetailPresenter & IUserDetailInteractorOutput = UserDetailPresenter()
        
        userDetailRef.presenter = presenter
        userDetailRef.presenter?.interactor = UserDetailInteractor()
        userDetailRef.presenter?.interactor?.presenter = presenter
        userDetailRef.presenter?.interactor?.user = user
        userDetailRef.presenter?.router = UserDetailRouter()
        userDetailRef.presenter?.view = userDetailRef
    }
}
