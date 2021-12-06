//
//  UserDetailRepository.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailRepository: IUserDetailRepo{
    
    let dataSource : IUserDetailDataSource = UserDetailAPIDataSource()
    
}
