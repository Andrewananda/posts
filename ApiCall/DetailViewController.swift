//
//  DetailViewController.swift
//  ApiCall
//
//  Created by Andrew Ananda on 12/03/2021.
//  Copyright © 2021 Andrew Ananda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    
    var descriptionText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = descriptionText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
