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
        view.translatesAutoresizingMaskIntoConstraints = false
  
        return view
    }()
    
    // Mark: делаю новую кнопку:
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Редактировать", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
       
       return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .lightGray
        self.title = "Профиль"
        
        view.addSubview(profileView)
        view.addSubview(editButton)
        navBarCustomization()
        addConstrains()
        setupGestures()
    }
    
    
    @objc func pressButton() {
        print("тeст кнопки редактирования")
    }
    
    // Mark: создаю "чёлку" навигационного бара
    func navBarCustomization () {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        self.navigationItem.title = "Профиль"
        
        // Mark: добавляю кнопку справа нав бара (это так, для саморазвития)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didHideKeyboard(_ notification: Notification){
        self.forcedHidingKeyboard()
    }
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        print("keyboard is off")
    }
    
    
    func addConstrains(){
        NSLayoutConstraint.activate([
            
        profileView.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor),
        profileView.leftAnchor.constraint(equalTo: super.view.leftAnchor),
        profileView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
        profileView.heightAnchor.constraint(equalToConstant: 220),

        editButton.leftAnchor.constraint(equalTo: super.view.leftAnchor),
        editButton.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
        editButton.bottomAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.bottomAnchor),
        editButton.heightAnchor.constraint(equalToConstant: 50),
                 ])

    }
}
    





/* в методе viewWillLayoutSubviews() задайте ему frame, равный frame корневого view
 
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
 
     profileView.frame = CGRect(x:0, y: 90, width: view.frame.width, height: view.frame.height)
    
 profileView.frame = CGRect(origin: .zero, size: view.bounds.size)
 }
       */
       
    


