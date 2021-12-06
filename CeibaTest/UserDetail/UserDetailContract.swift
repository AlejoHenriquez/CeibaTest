//
//  ListCT.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation


protocol IUserDetailPresenter{
    var interactor: IUserDetailInteractor? {get set}
    var view: IUserDetailView? {get set}
    var router: IUserDetailRouter? {get set}
    
    func didLoad()
}

protocol IUserDetailView: AnyObject{

}

protocol IUserDetailInteractor{
    var presenter: IUserDetailInteractorOutput? {get set}
}

protocol IUserDetailInteractorOutput: AnyObject{
    
}

protocol IUserDetailRouter{
    static func createUserDetailModule(UserDetailRef: UserDetailView)
}

