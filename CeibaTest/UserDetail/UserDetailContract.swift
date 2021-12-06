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
    func showSpinner()
    func hideSpinner()
    
    func showPosts(posts: [Post])
    func showUser(user: User)
}

protocol IUserDetailInteractor{
    var presenter: IUserDetailInteractorOutput? {get set}
    var user: User? {get set}
    
    func getPosts()
    func getUser() -> User
}

protocol IUserDetailInteractorOutput: AnyObject{
    func didFetchPosts(posts: [Post])
}

protocol IUserDetailRouter{
    static func createUserDetailModule(with userDetailRef: UserDetailView, user: User)
}

