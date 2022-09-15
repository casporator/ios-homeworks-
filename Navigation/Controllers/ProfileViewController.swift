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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        addConstraints()
        tableView.reloadData()
        
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), 
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
  }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
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



  
       
    


