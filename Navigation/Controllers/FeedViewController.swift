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
    
    let button: CustomButton = {
        let button = CustomButton(title: " читать пост #1")
        button.layer.borderColor = UIColor.white.cgColor // этим кнопкам добавляю рамку
        button.layer.borderWidth = 2
        return button
    }()
       
    let secondButton: CustomButton = {
       let button = CustomButton(title: " читать пост #2")
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
      return button
    }()
    
    let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.spacing = 10.0
        stack.toAutoLayout()
       
        return stack
    }()
       
    override func viewDidLoad() {
     super.viewDidLoad()
            
        view.backgroundColor = .systemIndigo
    
        view.addSubview(stackView)
        addView()
        navBarCustomization()
        setConstraints()
        addButtunAction()
    }
        
         
    func addView(){
            stackView.addArrangedSubview(button)
            stackView.addArrangedSubview(secondButton)
    }
        
    func setConstraints(){
       NSLayoutConstraint.activate([
            
           stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor) ])
    }

    // Mark: функция нажатия на кнопку
     func addButtunAction() {
        [button,secondButton].forEach{
            
             ($0).buttonAction = { [self] in
        let detailController = PostViewController()
        detailController.titlePost = postTitle.title //передаём наш пост в виде заголовка на PostView
        navigationController?.pushViewController(detailController, animated: false)
    }
  }
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
            
            // Mark: добавляю кнопку справа нав бара
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
            self.navigationItem.rightBarButtonItem?.tintColor = .black
         
        
        }
    }

