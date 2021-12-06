//
//  UserDetailInteractor.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailInteractor: IUserDetailInteractor{
    
    weak var presenter: IUserDetailInteractorOutput?
    let repository: IUserDetailRepo = UserDetailRepository()
    
}

