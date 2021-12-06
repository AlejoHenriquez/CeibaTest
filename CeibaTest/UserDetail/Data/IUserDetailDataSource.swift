//
//  IUserDetailDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserDetailDataSource{
    func getUsers(handler: @escaping ([UserModel]) -> Void)
}
