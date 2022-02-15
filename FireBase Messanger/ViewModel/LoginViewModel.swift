//
//  LoginViewModel.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import Foundation
import Firebase

class LoginViewModel{
    
    static var sharedLoginViewModel  = LoginViewModel()
    
    func login(email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password){ [weak self ] user, error in
            if error == nil{
                print(user as Any)
//                let homeVc = self?.storyboard?.instantiateViewController(withIdentifier: "MainHomeViewController")as! MainHomeViewController
//                self?.navigationController?.pushViewController(homeVc, animated: true)
            }else if user != nil{
                print("hello")
            }else{
                print("something is wrong")
            }
        }
    }
}
