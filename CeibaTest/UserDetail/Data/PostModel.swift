//
//  PublicationModel.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 6/12/21.
//

import Foundation

struct PostModel: Decodable{
    let body: String
    let id: Int
    let title: String
    let userId: Int
    
    func getPost() -> Post{
        return Post(body: body, id: id, title: title, userId: userId)
    }
}
