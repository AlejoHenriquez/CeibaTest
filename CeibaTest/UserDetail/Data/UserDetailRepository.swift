//
//  UserDetailRepository.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

class UserDetailRepository: IUserDetailRepo{
    
    let dataSource : IUserDetailDataSource = UserDetailAPIDataSource()
    
    func getPosts(from userID: Int, completion: @escaping ([Post]) -> Void){
        dataSource.getPosts(withUserID: userID) { postsModel in
            //print(postsModel)
            var posts = [Post]()
            for post in postsModel {
                posts.append(post.getPost())
            }
            completion(posts)
        }
    }
}
