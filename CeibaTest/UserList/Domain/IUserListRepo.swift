//
//  IUserListRepo.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserListRepo{
    func getUsers(from sourceData: SourceData, handler: @escaping ([User]) -> ())
    func saveLocalUsers(users: [User])
}
