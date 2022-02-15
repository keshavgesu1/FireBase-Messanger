//
//  ViewController.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 15
        btnSignUp.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }


}

