//
//  Post.swift
//  ApiCall
//
//  Created by Andrew Ananda on 10/03/2021.
//  Copyright © 2021 Andrew Ananda. All rights reserved.
//

import Foundation

struct Post : Codable{
    let userId : Int?
    let id : Int?
    let title: String?
    let body: String?
}
