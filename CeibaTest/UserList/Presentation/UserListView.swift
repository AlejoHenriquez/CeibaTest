//
//  ViewController.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import UIKit

class UserListView: UIViewController  {
    
    var presenter : IUserListPresenter?
    var collectionLayout = UICollectionViewFlowLayout()
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyLabel: UILabel!
    var spinner: UIView?
    
    
    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar Usuarios"
        navigationItem.searchController = searchController
        
        collectionView.collectionViewLayout = collectionLayout
        UserListRouter.createUserListModule(userListRef: self)
        presenter!.didLoad()
    }
}

extension UserListView: IUserListView{
   
    func showSpinner(){
        spinner = UIViewController.displaySpinner(onView: view)
    }
    
    func hideSpinner(){
        if let _ = spinner{
            UIViewController.removeSpinner(spinner: spinner!)
        }
    }
    
    func showEmptyLabel() {
        emptyLabel.isHidden = false
    }
    
    func hideEmptyLabel(){
        emptyLabel.isHidden = true
    }
    
    func showUsers(users: [User]) {
        self.users = users
        collectionView.reloadData()
    }
}

extension UserListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserListCell
        let user = users[indexPath.row]
        
        cell.name.text = user.name
        cell.phone.text = user.phone
        cell.email.text = user.email
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 130)
    }
}

extension UserListView: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.filter(searchController.searchBar.text!)
    }
}
