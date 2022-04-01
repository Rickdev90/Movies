//
//  ViewModelHome.swift
//  Netflix
//
//  Created by Rick on 30/03/22.
//

import Foundation

public class ViewModelHome{
    
    var refreshHome = {() -> () in}
    var dataHomeResponse: Movies? {
        didSet {
            refreshHome()
        }
    }
    
    func retriveMovieList(){
        guard let url = URL(string: Constants.urlGetPopular + Constants.ApiKey) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let json = data else {return}
            
            do {
                let decoder = JSONDecoder()
                self.dataHomeResponse = try decoder.decode(Movies.self, from: json)
            } catch let error {
                print("Error : \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
