//
//  ListPT.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailPresenter: IUserDetailPresenter{
    
    var router: IUserDetailRouter?
    var interactor: IUserDetailInteractor?
    weak var view: IUserDetailView?
    
    func didLoad() {
        view?.showSpinner()
        interactor?.getPosts()
        view?.showUser(user: interactor!.getUser())
    }
}


extension UserDetailPresenter: IUserDetailInteractorOutput{
    func didFetchPosts(posts: [Post]){
        print(posts)
        view?.hideSpinner()
        view?.showPosts(posts: posts)
    }
}
