//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
final class ProfileViewModel {
   
    let profileHeaderView = ProfileHeaderView()
    var postsData: [PostModel] = []
    var currentUser: User
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func setUser() {
        profileHeaderView.setupUserData(user: currentUser)
    }
    
    func setPosts() {
        postsData = PostModel.posts

    }
}
