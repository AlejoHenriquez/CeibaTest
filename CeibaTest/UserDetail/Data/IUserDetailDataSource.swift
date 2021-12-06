//
//  IUserDetailDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

protocol IUserDetailDataSource{
    func getPosts(withUserID id: Int, completion: @escaping ([PostModel])->Void)
}
