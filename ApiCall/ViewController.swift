//
//  ViewController.swift
//  ApiCall
//
//  Copyright © 2020 Andrew Ananda. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var postManager = PostManager()
    var postsData : [Post] = []
    var textDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postManager.deligate = self
        postManager.fetchPosts()
        
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: PostManagerDeligate {
    func didUpdatePost(post: [Post]) {
        for data in post {
            let post = Post(userId: data.userId, id: data.id, title: data.title, body: data.body)
            self.postsData.append(post)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        cell.myLabel.text = postsData[indexPath.row].title
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textDescription = String(postsData[indexPath.row].body!)
        self.performSegue(withIdentifier: "DetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            let vcDestination = segue.destination as! DetailViewController
            vcDestination.descriptionText = textDescription
        }
    }
}

