//
//  SignUpViewController.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var btnSignup: UIButton!
    
    @IBOutlet weak var fullNameTextfield: UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignup.layer.cornerRadius = 15

    }
    
    @IBAction func btnSignUp(_ sender: Any) {
       // SignUpViewModel.sharedSignUpViewModel.fireBaseAuth(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        Auth.auth().createUser(withEmail:emailTextField.text ?? "" , password:passwordTextField.text ?? "" ) { authResult, error in
            print(error ?? "")
            print(authResult as Any)
            if error == nil{
                let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                self.navigationController?.pushViewController(homeVc, animated: true)
                print(authResult as Any)
            }else if authResult != nil{
                let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                self.navigationController?.pushViewController(homeVc, animated: true)
                print(authResult as Any)
            }
        }
//        emailTextField.text = ""
//        passwordTextField.text = ""
    }
    
}
