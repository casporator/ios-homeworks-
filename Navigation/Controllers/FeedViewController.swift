//
//  FeedViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 15.08.2022.
//

import UIKit

class FeedViewController: UIViewController {
    // Mark: создание обьекта Post
    var postTitle = HeadPost(title: "Пост")
    
        let button = UIButton()
        let secondButton = UIButton()
        let stackView = UIStackView()
       
    override func viewDidLoad() {
     super.viewDidLoad()
            
        view.backgroundColor = .systemIndigo
        // self.title = "Лента"
        view.addSubview(stackView)
        navBarCustomization()
      
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.setTitle(" читать пост ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Hannotate SC Bold", size: 30)
        //button.setImage(UIImage(systemName: "book.circle"), for: .normal)
        //button.setImage(UIImage(systemName: "book.circle.fill"), for: .highlighted)
        button.backgroundColor = .systemYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(goToPostController), for: .touchUpInside)
        
        secondButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        secondButton.setTitle(" читать пост ", for: .normal)
        secondButton.titleLabel?.font = UIFont(name: "Hannotate SC Bold", size: 30)
        //secondButton.setImage(UIImage(systemName: "book.circle"), for: .normal)
        //secondButton.setImage(UIImage(systemName: "book.circle.fill"), for: .highlighted)
        secondButton.backgroundColor = .systemYellow
        secondButton.setTitleColor(UIColor.black, for: .normal)
        secondButton.layer.cornerRadius = 8
        secondButton.layer.borderColor = UIColor.white.cgColor
        secondButton.layer.borderWidth = 2
        secondButton.addTarget(self, action: #selector(goToPostController), for: .touchUpInside)
       
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(secondButton)
       
       NSLayoutConstraint.activate([
            
           stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor) ])
    }

    // Mark: функция нажатия на кнопку
    @objc func goToPostController() {
        let detailController = PostViewController()
        detailController.titlePost = postTitle.title //передаём наш пост в виде заголовка на PostView
        navigationController?.pushViewController(detailController, animated: false)
    }
        
        func navBarCustomization () {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .systemBackground
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navigationController?.navigationBar.tintColor = .black
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationItem.title = "Лента"
            
            // Mark: добавляю кнопку справа нав бара (это так, для саморазвития)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
            self.navigationItem.rightBarButtonItem?.tintColor = .black
         
        
        }
    }

