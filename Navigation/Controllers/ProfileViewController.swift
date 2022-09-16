//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 15.08.2022.
//


import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "indentPostTableCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "indentDefaultTableCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    private lazy var duplicateAvatar : UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "IMG_0037")
        avatar.layer.cornerRadius = 60
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.isUserInteractionEnabled = true
        avatar.toAutoLayout()
        
        return avatar
    }()

    private lazy var xmarkView : UIImageView = {
        let xmark = UIImageView()
        xmark.image = UIImage(systemName: "xmark")
        xmark.tintColor = .white
        xmark.isHidden = true
        xmark.isUserInteractionEnabled = true
        xmark.toAutoLayout()
        
        return xmark
    }()
    
    private lazy var hiddenView : UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.isHidden = true
        view.toAutoLayout()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(tableView)
        addConstraints()
        tableView.reloadData()
       }


    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
 
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), 
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    
    //MARK: передаю ProfileHeader в Хэдер
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return posts.count
        }
        return 0
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: false)
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            return PhotoTableViewCell()
            
        }else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "indentPostTableCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "indentDefaultTableCell", for: indexPath)
        
            return cell
        }
        
        let PostModel = PostTableViewCell.ViewModel(
            autor: posts[indexPath.row].autor,
            descriptionText: posts[indexPath.row].description,
            likes: "Likes: \(posts[indexPath.row].likes)",
            views: "Views: \(posts[indexPath.row].views)",
            image: posts[indexPath.row].image
        )
        cell.setup(with: PostModel)
        
        return cell
            
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "defaultTableCellIdentifier", for: indexPath)
        }
    }
}



  
       
    


