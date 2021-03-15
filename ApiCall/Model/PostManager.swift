//
//  PostManager.swift
//  ApiCall
//
//  Created by Andrew Ananda on 10/03/2021.
//  Copyright © 2021 Andrew Ananda. All rights reserved.
//

import Foundation
import Alamofire

protocol PostManagerDeligate{
    func didUpdatePost(post: [Post])
}

struct PostManager {
    let postUrl = "https://jsonplaceholder.typicode.com/posts"
    
    var deligate : PostManagerDeligate?
    
    func fetchPosts() {
        print("Post Triggered")
        AF.request(postUrl, method: .get).responseDecodable(of: [Post].self) { (response) in
            if let error = response.error {
                print("An error occured \(error)")
            } else if let data = response.value {
                self.deligate?.didUpdatePost(post: data)
            }
        }
    }
}
