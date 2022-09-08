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
        let tableView = UITableView(frame: .zero, style: .grouped) // (.plain это для себя)
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

        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        addConstraints()
        tableView.reloadData()
        
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), //тут по уму я хотел прикрепить к bottomAncchor, но тогда почему-то белый экран. не могу понять в чём причина
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
  }
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    
    //MARK: передаю ProfileHeader в первую секцию
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //я так понимаю если число секций = 1, то можно не прописывать?
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
}



  
       
    


