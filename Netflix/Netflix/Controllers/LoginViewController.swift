//
//  LoginViewController.swift
//  Netflix
//
//  Created by Rick on 29/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var invalidLbl: UILabel!
    
    var viewModel = ViewModelLogin()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        invalidLbl.isHidden = true
        loginBtn.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        
    }
    
    
    @objc func logInAction() {
        showSpinner()
        guard let user = userTxt.text else {return}
        guard let password = passTxt.text else {return}
        let modelUser = UserPass(user: user, pass: password)
        viewModel.sendCredentials(user: modelUser.user ?? "", pass: modelUser.pass ?? "")
        viewModel.refreshData = {[weak self]() in
            DispatchQueue.main.async {
                self?.removeSpinner()
                if self?.viewModel.dataLoginResponse?.success == true{
                    self?.performSegue(withIdentifier: "segueHome", sender: self)
                }else{
                    self?.invalidLbl.isHidden = false
                }
            }
        }
    }
}

