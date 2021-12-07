//
//  UserListAPIDataSource.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation
import Alamofire

class UserListAPIDataSource: IUserListDataSource{
    
    
    func getUsers(handler: @escaping ([UserModel]) -> Void){
        let url = "\(Environment.baseUrl)/users"
        AF.request(url, method: .get,  parameters: nil).response{response in
            print("response", response)
            
            guard let data = response.data else {
                handler([])
                return
            }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([UserModel].self, from: data)
                handler(users)
            } catch let error {
                print(error)
                handler([])
            }
        }
    }
}
