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
    
    @IBOutlet weak var navigateToSDKBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    var loggedIn = false
    
    private var userViewModel = UsersViewModel()
    var accessToken = false
    
    private var deviceViewModel = DeviceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        stackView.isHidden = true
        navigateToSDKBtn.isHidden = true
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
            self.showSpinner(onView: self.view)

            Auth0
                .webAuth()
                .start { result in
                    switch result {
                    case .success(let credentials):
                        self.loginBtn.setTitle("LOGOUT", for: .normal)
                        self.loginBtn.isHidden = true
                        self.loggedIn = true
                        
                        Networking.shared.token = credentials.accessToken
                        
                        self.loadUserData()
                        
                    case .failure(let error):
                        print("Login Failed with: \(error)")
                        self.loginBtn.setTitle("Login", for: .normal)
                        DispatchQueue.main.async {
                            self.removeSpinner()
                        }
                    }
                }
        }
        
    }
    
    func loadUserData() {
        userViewModel.loadUsersData()
        
        userViewModel.onCompleteUser = {
            DispatchQueue.main.async {
                self.removeSpinner()
                self.stackView.isHidden = false
                self.navigateToSDKBtn.isHidden = false
                self.username.text = "Username: \(self.userViewModel.userData?.name ?? "")"
                self.email.text = "Email: \(self.userViewModel.userData?.email ?? "")"
            }
        }
        
        userViewModel.onErrorUser = { error in
            Swift.debugPrint(error)
            DispatchQueue.main.async {
                self.removeSpinner()
            }
        }
    }
    
    @IBAction func navigateToSDKAction(_ sender: Any) {
        deviceViewModel.loadDeviceData()
        
        deviceViewModel.onCompleteDevice = {
            DispatchQueue.main.async {
                self.removeSpinner()
                self.stackView.isHidden = false
                self.navigateToSDKBtn.isHidden = false
            }
        }
        
        deviceViewModel.onErrorDevice = { error in
            Swift.debugPrint(error)
            DispatchQueue.main.async {
                self.removeSpinner()
            }
        }
        
    }

}
