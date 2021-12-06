//
//  ViewController.swift
//  CeibaTest
//
//  Created by Alejandro Henriquez on 5/12/21.
//

import UIKit

class UserDetailView: UIViewController  {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var presenter : IUserDetailPresenter?
    var spinner: UIView?
    var collectionLayout = UICollectionViewFlowLayout()
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionLayout

        presenter!.didLoad()
    }
}

extension UserDetailView: IUserDetailView{
    func showSpinner(){
        spinner = UIViewController.displaySpinner(onView: view)
    }
    
    func hideSpinner(){
        if spinner != nil{
            UIViewController.removeSpinner(spinner: spinner!)
        }
    }
    
    func showPosts(posts: [Post]){
        self.posts = posts
        collectionView.reloadData()
    }
    
    func showUser(user: User){
        name.text = user.name
        phone.text = "📞 \(user.phone)"
        email.text = "✉️ \(user.email)"
    }
}

extension UserDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        
        cell.title.text = post.title
        cell.body.text = post.body
        
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let post = posts[indexPath.row]
        
        let cellWidth = collectionView.frame.width - 24
        let size = CGSize(width: cellWidth - 24, height: 1000)
        let att = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimate = NSString(string: post.body).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: att, context: nil)
        
        return CGSize(width: cellWidth, height: estimate.height + 60)
    }
}
