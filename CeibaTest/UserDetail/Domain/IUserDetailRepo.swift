//
//  IUserDetailRepo.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserDetailRepo{
    func getPosts(from userID: Int, completion: @escaping ([Post]) -> Void)
}
