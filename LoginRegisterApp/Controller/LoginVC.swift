//
//  ViewController.swift
//  LoginRegisterApp
//
//  Created by Mohsen Abdollahi on 5/23/19.
//  Copyright © 2019 Mohsen Abdl. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }
    
    
    @IBAction func forgotClicked(_ sender: Any) {
    }
    
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let email = emailTxt.text , !email.isEmpty,
              let password = passTxt.text , !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error)  in
            
            if let error = error {
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            print("Login was successful !")
            
            
        }
    }
    
    
    @IBAction func guestClicked(_ sender: Any) {
    }
    
    
}

