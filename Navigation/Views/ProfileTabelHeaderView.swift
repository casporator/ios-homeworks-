//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Oleg Popov on 22.08.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    
    private let image: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "IMG_0037")
        photo.layer.cornerRadius = 60
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.masksToBounds = true
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.isUserInteractionEnabled = true //добавляю реакцию на нажатие аватарки
        
        return photo
    }()
    
    private let label: UILabel = {
        
        let name = UILabel()
        name.text = "Hipster Dog"
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private var statusLabel: UILabel = {
        var statusLbl = UILabel()
        statusLbl.text = "Waiting for your status"
        statusLbl.textColor = .gray
        statusLbl.font = UIFont(name: "regular", size: 14.0)
        statusLbl.translatesAutoresizingMaskIntoConstraints = false
        
        return statusLbl
    }()
    
    private let textField : UITextField = {
        let txtField = UITextField()
        txtField.font = UIFont(name: "regular", size: 15.0)
        txtField.placeholder = " Enter you status"
        txtField.backgroundColor = .white
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.layer.borderWidth = 1
        txtField.layer.cornerRadius = 12
        txtField.layer.borderColor = UIColor.black.cgColor
        txtField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return txtField
    }()
    
    
    var statusText: String = ""
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addViews()
        addConstraints()
        addGestures()
        addNotifications()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func buttonPressed() {
        
        if statusText != "" {
            statusLabel.text = statusText
            print (statusText)
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        if let text = textField.text {
            statusText = text
        }
    }
   
func addConstraints(){
    
    image.snp.makeConstraints { (make) -> Void in
        make.height.width.equalTo(120)
        make.top.equalTo(self.snp.top).offset(16)
        make.left.equalTo(self.snp.left).offset(16)
            }

    label.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(self.snp.top).offset(27)
        
        make.left.equalTo(image.snp.right).offset(16)
    }

    statusLabel.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(self.snp.top).offset(54)
        make.left.equalTo(image.snp.right).offset(16)
        make.right.equalTo(self.snp.right).offset(-16)
    }

    textField.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(self.snp.top).offset(80)
        make.left.equalTo(image.snp.right).offset(16)
        make.right.equalTo(self.snp.right).offset(-16)
        make.height.equalTo(40)
    }

    button.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(self.snp.left).offset(16)
        make.right.equalTo(self.snp.right).offset(-16)
        make.top.equalTo(image.snp.bottom).offset(16)
        make.bottom.equalTo(self.snp.bottom).offset(-16)
        make.height.equalTo(50)
    }
}
    
   
    func addViews(){
        addSubviews(image, label, button, statusLabel, textField)
       
    }

    //MARK: устанавливаю тач и уведомление о клике на аватарку
    func addGestures(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(_:)))
        self.image.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        NotificationCenter.default.post(name: Notification.Name("userTouchAva"), object: nil)
        //MARK: скрываем оригинальный аватар
        image.isHidden = true
    
    }
    
    //MARK: уведомление о клике на xmarkView
    func addNotifications(){
        NotificationCenter.default.addObserver(self,
            selector: #selector(didTouchXmark(notification:)),
            name: Notification.Name("userTouchXmark"),
            object: nil)
    }
    
    @objc func didTouchXmark(notification: Notification) {
        image.isHidden = false
    }
}

