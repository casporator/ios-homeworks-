//
//  Posts.swift
//  Navigation
//
//  Created by Oleg Popov on 30.10.2022.
//

import Foundation
import iOSIntPackage
import UIKit

public struct PostsViewModel {
    public var autor: String
    public var description: String
    public var image: UIImage
    public var filter: ColorFilter
    public var likes: Int
    public var views: Int
}
