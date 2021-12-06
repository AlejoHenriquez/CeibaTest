//
//  Post.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 6/12/21.
//

import Foundation

struct Post: Decodable{
    let body: String
    let id: Int
    let title: String
    let userId: Int
}
