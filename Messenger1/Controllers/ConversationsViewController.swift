//
//  ViewController.swift
//  Messenger1
//
//  Created by Christian Lorenzo on 10/1/23.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    
    //Outlets:
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
    }

    //Verifying that the user is not logged in, and if it's not logged in
    //then go ahead and present the log in screen for the user. 
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    

}

