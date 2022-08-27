//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Oleg Popov on 22.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    
    private let image: UIImageView = {
        // устанавливаю согласно макету (но размер на макете не указан!)
        let photo = UIImageView(frame: CGRect(x: 16, y: 16, width: 120, height: 120))
        photo.image = UIImage(named: "IMG_0037")
        photo.layer.cornerRadius = 60
        
        photo.layer.masksToBounds = true
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        
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
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //настраиваем тени
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        //почему он ругается на self? в InfoViewController я использовал точно такой же метод и там не было желтого знака...
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
        txtField.placeholder = "Enter you status"
        txtField.backgroundColor = .white
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        txtField.layer.borderWidth = 1
        txtField.layer.cornerRadius = 12
        txtField.layer.borderColor = UIColor.black.cgColor
        
        txtField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return txtField
    }()
    
    
    var statusText: String = ""
    
    
    /*тут у меня была засада полная! ничего не работало пока мне ребята из группы не подсказали
     написать:
    
     override init(frame: CGRect) {
     super.init(frame: frame)
     }
     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
     я в замешательстве...очевидно что это инициализатор, но почему и зачем?
     */
   
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        addConstraints()
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
       NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 16),
        
        button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
        
        statusLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 16),
        
        /* тут по условию макета надо сделать отступ от кнопки -34, НО!! при выполнении задания
        со звездой я должен вставить между ними тестовую панель, а она по условию макета имеет
        ширину 40! так что я этот момент не понял и отступ увеличил до -54
        */
        statusLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -54),
        
        textField.heightAnchor.constraint(equalToConstant: 40),
        textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
        textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        textField.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 16)
        
        
       ])
    
    }
   
    func addViews(){
        addSubview(image)
        addSubview(label)
        addSubview(button)
        addSubview(statusLabel)
        addSubview(textField)
    }
    
    
    
}
