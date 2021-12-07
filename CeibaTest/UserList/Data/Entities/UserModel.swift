//
//  UserModel.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import Foundation

struct UserModel: Codable{
    //let address: AddressModel?
    let email: String
    let id: Int
    let name: String
    let phone: String
    let username: String
    let website: String
    
    func getUser() -> User{
        return User(email: email, id: id, name: name, phone: phone, username: username, website: website)
    }
}
