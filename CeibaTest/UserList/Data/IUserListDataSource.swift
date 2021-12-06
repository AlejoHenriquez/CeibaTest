//
//  IUserListDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserListDataSource{
    func getUsers(handler: @escaping ([UserModel]) -> Void)
}
