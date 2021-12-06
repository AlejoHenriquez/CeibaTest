//
//  UserDetailInteractor.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailInteractor: IUserDetailInteractor{
    
    weak var presenter: IUserDetailInteractorOutput?
    var user: User?
    let repository: IUserDetailRepo = UserDetailRepository()
    
    
    func getPosts() {
        repository.getPosts(from: user!.id) { [weak self] posts in
            guard let _ = self else{
                return
            }
            
            self!.presenter?.didFetchPosts(posts: posts)
        }
    }
    
    func getUser() -> User{
        return user!
    }
}

