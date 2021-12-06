//
//  ListRouter.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailRouter: IUserDetailRouter{
    
    
    class func createUserDetailModule(UserDetailRef: UserDetailView){
        let presenter: IUserDetailPresenter & IUserDetailInteractorOutput = UserDetailPresenter()
        
        UserDetailRef.presenter = presenter
        UserDetailRef.presenter?.interactor = UserDetailInteractor()
        UserDetailRef.presenter?.interactor?.presenter = presenter
        UserDetailRef.presenter?.router = UserDetailRouter()
        UserDetailRef.presenter?.view = UserDetailRef
    }
}
