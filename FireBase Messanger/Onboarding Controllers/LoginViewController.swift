//
//  LoginViewController.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import UIKit
import FirebaseCrashlytics
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 15
        
    }
    //Login Button
    func login(){
        LoginViewModel.sharedLoginViewModel.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func btnLogIn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? ""){ [weak self ] user, error in
            if error == nil{
                print(user as Any)
                let homeVc = self?.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                self?.navigationController?.pushViewController(homeVc, animated: true)
                self?.emailTextField.text = ""
                self?.passwordTextField.text = ""
            }else if user != nil{
                print("hello")
            }else{
                print("something is wrong")
            }
        }
        
    }
    
    
}
