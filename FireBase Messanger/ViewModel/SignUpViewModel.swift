//
//  SignUpViewModel.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import Foundation
import Firebase

class SignUpViewModel {
    
static var sharedSignUpViewModel  = SignUpViewModel()
    
    func fireBaseAuth( email:String, password:String){
        Auth.auth().createUser(withEmail:email , password:password ) { authResult, error in
            print(error ?? "")
            print(authResult as Any)
            if error == nil{
                print(authResult as Any)
            }else if authResult != nil{
                print("hello")
            }
        }
    }
}
