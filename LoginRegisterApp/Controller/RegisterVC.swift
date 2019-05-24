//
//  RegisterVC.swift
//  LoginRegisterApp
//
//  Created by Mohsen Abdollahi on 5/24/19.
//  Copyright © 2019 Mohsen Abdl. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var confirmCheckImage: UIImageView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTxt.addTarget(self, action: #selector(textFiledDidchange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFiledDidchange(_:)), for: UIControl.Event.editingChanged)
        

    }
    
    
    @objc func textFiledDidchange( _ textField: UITextField) {
        // if we have started typing confirm passwrod text field
        if textField == confirmPassTxt {
            passCheckImage.isHidden = false
            confirmCheckImage.isHidden = false
            
        }
        
        // make it so when the passwords match, the checkmarks turn green
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImage.image = UIImage(named: "green_check")
            confirmCheckImage.image = UIImage(named: "green_check")
        } else
        {
            passCheckImage.image = UIImage(named: "red_check")
            confirmCheckImage.image = UIImage(named: "red_check")
        }
    }
    
    
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailTxt.text , !email.isEmpty,
            let username = usernameTxt.text , !username.isEmpty,
            let password = passwordTxt.text , !password.isEmpty else { return }
        
        activityIndicator.startAnimating()
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                debugPrint(error)
            }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            print("Succesfully Register new User !")
        }
    }
}
