//
//  Photo.swift
//  Navigation
//
//  Created by Oleg Popov on 11.09.2022.
//

import Foundation
import UIKit
// правильно ли я делаю, что выношу в отдельный swift файл? или лучше лишний раз их не плодить? просто на лекции мы так не делали. Я не понимаю как правильно оформлять

let photoData = ["pig1.jpeg", "pig2.jpeg", "pig3.jpeg", "pig4.jpeg", "pig5.jpeg", "pig6.jpeg", "pig7.jpeg", "pig8.jpeg", "pig9.jpeg", "pig10.jpeg", "pig11.jpeg", "pig12.jpeg", "pig13.jpeg", "pig14.jpeg","pig15.jpeg", "pig16.jpeg", "pig17.jpeg", "pig18.jpeg", "pig19.jpeg", "pig20.jpeg", "pig21.jpeg", "pig22.jpeg", "pig28.jpeg", "pig24.jpeg", "pig25.jpeg", "pig26.jpeg"]

//MARK: задаю размер фотографий в ленте профиля
let photoSizeInFeed = (UIScreen.main.bounds.width - 48)/4
//MARK: задаю размер фотографий в альбоме
let photoSizeInAlbom = (UIScreen.main.bounds.width - 32)/3
