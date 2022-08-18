//
//  FeedViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 15.08.2022.
//

import UIKit
// создание структуры
struct Post {
    var title : String
}


class FeedViewController: UIViewController {
    // создание обьекта Post
    var postTitle = Post(title: "Пост №1")
    
    
    //cоздаем кнопку "новый пост" :
    
        let button = UIButton()
        
        // решил сделать авто настройки по размеру кнопки
       
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        //хотел сделать закругление кнопки, но метод почему-то не работае:
        //button.layer.cornerRadius = 0.3 
        button.setTitle(" пост №1 ", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        button.titleLabel?.font = UIFont(name: "Hannotate SC Bold", size: 20)
        button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        
        button.center = self.view.center
        
        
        // создаем тайтл заголовка;
        self.title = "Лента"
        
        //включаем отображение кнопки на экране:
        view.addSubview(button)
        

        // ставим таргет на кнопку
        button.addTarget(self, action: #selector(goToPostController), for: .touchUpInside)
        
    }
    
    // функция нажатия на кнопку
    @objc func goToPostController() {
        let detailController = PostViewController()
        detailController.titlePost = postTitle.title //передаём наш пост в виде заголовка на PostView
        navigationController?.pushViewController(detailController, animated: false)
        }
    }
    

