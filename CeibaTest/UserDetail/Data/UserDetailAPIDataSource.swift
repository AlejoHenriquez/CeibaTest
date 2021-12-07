//
//  UserDetailAPIDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation
import Alamofire

class UserDetailAPIDataSource: IUserDetailDataSource{
    func getPosts(withUserID id: Int, completion: @escaping ([PostModel])->Void){
        let url = "\(Environment.baseUrl)/posts?userId=\(id)"
        AF.request(url, method: .get,  parameters: nil).response{response in
            print("response", response)
            
            guard let data = response.data else {
                completion([])
                return
            }
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([PostModel].self, from: data)
                completion(posts)
            } catch let error {
                print(error)
                completion([])
            }
        }
    }
}
