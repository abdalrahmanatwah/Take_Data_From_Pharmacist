//
//  ViewController.swift
//  test5
//
//  Created by MACBOOK on 8/21/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit

import FirebaseAuth

class ViewController: UIViewController {
   
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Login(_ sender: UIButton) {
    
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text! , completion: { (user:FIRUser?, err:Error?) in
            let ve  = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
            self.present(ve, animated: true, completion: nil)
        })
    }
}

