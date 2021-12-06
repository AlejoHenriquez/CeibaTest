//
//  IUserListRepo.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserListRepo{
    func getUsers(handler: @escaping ([User]) -> ())
}
