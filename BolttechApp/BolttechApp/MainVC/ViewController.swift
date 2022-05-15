//
//  ViewController.swift
//  BolttechApp
//
//  Created by Veera Subhash on 14/05/22.
//

import UIKit
import Auth0

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    var loggedIn = false
    
    private var viewModel = UsersViewModel()
    var accessToken = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        stackView.isHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        
        if loggedIn {
            Auth0
                .webAuth()
                .clearSession { result in
                    switch result {
                    case .success:
                        print("Logout Success")
                        self.loggedIn = false
                    case .failure(let error):
                        print("Logout Failed with: \(error)")
                    }
                }
        } else {
            self.loginBtn.isUserInteractionEnabled = false
            Auth0
                .webAuth()
                .start { result in
                    switch result {
                    case .success(let credentials):
                        self.loginBtn.setTitle("LOGOUT", for: .normal)
                        self.loggedIn = true
                        
                        Networking.shared.token = credentials.accessToken
                        
                        self.showSpinner(onView: self.view)
                        self.loadUserData()
                        
                    case .failure(let error):
                        print("Login Failed with: \(error)")
                        self.loginBtn.setTitle("Login", for: .normal)
                    }
                }
        }
        
    }
    
    func loadUserData() {
        viewModel.loadUsersData()
        
        viewModel.onCompleteUser = {
            DispatchQueue.main.async {
                self.removeSpinner()
                self.stackView.isHidden = false
                self.username.text = "Username: \(self.viewModel.userData?.name ?? "")"
                self.email.text = "Email: \(self.viewModel.userData?.email ?? "")"
            }
        }
        
        viewModel.onErrorUser = { error in
            Swift.debugPrint(error)
            DispatchQueue.main.async {
                self.removeSpinner()
            }
        }
    }

}


class Networking {
    static let shared = Networking()
    var token: String = ""
    
    func getApiAccessToken() -> String {
        return "Bearer \(self.token)"
    }
}
