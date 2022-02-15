//
//  HomeViewController.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("true", forKey: "homeScreen")
        // Do any additional setup after loading the view.
    }
    

    

}
