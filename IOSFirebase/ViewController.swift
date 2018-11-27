//
//  ViewController.swift
//  IOSFirebase
//
//  Created by Michael Coons on 11/26/18.
//  Copyright © 2018 Michael Coons. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!

    @IBOutlet weak var buttonCreateAccount: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func doBtnCreate(_ sender: Any) {
        if let email = textfieldEmail.text, let password = textfieldPassword.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                print (user?.user.email ?? "no email")
                print(Auth.auth().currentUser?.uid ?? "no userid")
            })
        }
    }
    
    @IBAction func doBtnLogin(_ sender: Any) {
        if Auth.auth().currentUser == nil{
            if let email = textfieldEmail.text, let password = textfieldPassword.text {
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil {
                        self.buttonLogin.setTitle("Logout", for: .normal)
                    }
            })
        }
    }
        else {
            do {
                try Auth.auth().signOut()
                self.buttonLogin.setTitle("Login", for: .normal)
            }
            catch {
                // notify user of error
            }
        }
    }
}

