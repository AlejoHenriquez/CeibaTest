//
//  ViewController.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import UIKit

class UserDetailView: UIViewController  {
    
    var presenter : IUserDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDetailRouter.createUserDetailModule(UserDetailRef: self)
        presenter!.didLoad()
    }
}

extension UserDetailView: IUserDetailView{
   
}
