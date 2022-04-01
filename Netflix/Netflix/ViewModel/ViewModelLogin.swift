//
//  ViewModelLogin.swift
//  Netflix
//
//  Created by Rick on 29/03/22.
//

import Foundation

public class ViewModelLogin {
    
    var refreshData = {() -> () in}
    var dataLoginResponse: LoginResponse?  {
        didSet {
            refreshData()
        }
    }
    
    func sendCredentials(user: String, pass: String){
        guard let url = URL(string: Constants.urlValidLogin + Constants.ApiKey) else {return}
        
        let params : [String: AnyHashable] = ["username": user,
                                              "password": pass,
                                              "request_token": "",]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .fragmentsAllowed)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                self.dataLoginResponse = try decoder.decode(LoginResponse.self, from: data)
            }
            catch{
                print(error)
            }
        }.resume()
    }
}
