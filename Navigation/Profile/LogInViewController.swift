//
//  LogInViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 03.09.2022.
//

import UIKit
extension UIView {

func toAutoLayout() {
    translatesAutoresizingMaskIntoConstraints = false
}

func addSubviews(_ subviews: UIView...) {
    subviews.forEach { addSubview($0) }
}
}

class LoginViewController : UIViewController {
    
    // MARK: создаю скролвью
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        
        return scrollView
    }()
    
    // MARK: coздаю лого:
    
    private lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.toAutoLayout()
        
        return logo
    }()
    
    // MARK: coздаю стэк для полей вводы пароля и почты:
    
    private lazy var stackViewTextFields : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.toAutoLayout()
        
        return stackView
        
    }()
    
    // MARK: создаю поле ввода почты
    
    private lazy var emailTextField : UITextField = {
        let email = UITextField()
        email.placeholder = "Email or phone"
        email.font = UIFont(name: "system", size: 16.0)
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: email.frame.height))
        email.leftViewMode = .always
        email.toAutoLayout()
        email.autocapitalizationType = .none
        email.layer.borderWidth = 0.5
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.layer.cornerRadius = 10
        
        return email
    }()
    
    // MARK: создаю поле ввода пароля
    private lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.font = UIFont(name: "system", size: 16.0)
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: password.frame.height))
        password.leftViewMode = .always
        password.toAutoLayout()
        password.isSecureTextEntry = true //делаю скрытый ввод текста
        password.autocapitalizationType = .none
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10
        
        return password
    }()
    
    //MARK: добавляю кнопку логин
    private lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Log In", for: .normal)
        login.setTitleColor(UIColor.white, for: .normal)
        login.setTitleColor(UIColor.black, for: .highlighted)
        login.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png") ?? UIImage())
        login.layer.cornerRadius = 10
        login.toAutoLayout()
        login.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
        return login
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        addViews()
        addConstraints()
        setupGestures()
    }
    
    // MARK: клавиатура
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(
            self,selector: #selector(self.didShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self,selector: #selector(self.didShowKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func didShowKeyboard(_ notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = self.loginButton.frame.origin.y + loginButton.frame.height
            
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 35
            : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            
            print("keyboard is on")
        }
    }
    
    //MARK: Функция тапа клавиатуры
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: Функция сокрытия клавиатуры
    @objc func didHideKeyboard(_ notification: Notification){
        self.forcedHidingKeyboard()
    }
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        print("keyboard is off")
    }
    
    //MARK: Функция нажатия кнопки Login
    @objc func pressLogin() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func addViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        stackViewTextFields.addArrangedSubview(emailTextField)
        stackViewTextFields.addArrangedSubview(passwordTextField)
        scrollView.addSubview(stackViewTextFields)
        scrollView.addSubview(loginButton)
        
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            stackViewTextFields.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackViewTextFields.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 16),
            stackViewTextFields.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            emailTextField.leftAnchor.constraint(equalTo: stackViewTextFields.leftAnchor, constant: 0),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
            passwordTextField.leftAnchor.constraint(equalTo: stackViewTextFields.leftAnchor, constant: 0),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 16),
            
        ])
    }
}


