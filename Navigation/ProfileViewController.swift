//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 15.08.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    let profileView: UIView = {
        let view = ProfileHeaderView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        // создаем тайтл заголовка;
        self.title = "Профиль"
        
        view.addSubview(profileView)
        viewWillLayoutSubviews()
        navBarCustomization()
    }
    
    // создаю "чёлку" навигационного бара
    //правда я надеялся что координаты X и Y будут идти от бара, НО нет ((( все-равно от верхнего правого угла
    func navBarCustomization () {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        self.navigationItem.title = "Профиль"
        
        // добавляю кнопку справа нав бара (это так, для саморазвития)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .edit)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    //в методе viewWillLayoutSubviews() задайте ему frame, равный frame корневого view

 override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
     
     profileView.frame = CGRect(x:0, y: 90, width: view.frame.width, height: view.frame.height)
     
    // profileView.frame = CGRect(origin: .zero, size: view.bounds.size)
 
        
       
    }

}
