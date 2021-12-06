//
//  ViewController.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import UIKit

class UserListView: UIViewController {
    
    var presenter : IUserListPresenter?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension UserListView: IUserListView{
    
}
