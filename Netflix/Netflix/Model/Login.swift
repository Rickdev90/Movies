//
//  Login.swift
//  Netflix
//
//  Created by Rick on 29/03/22.
//

import Foundation

public struct LoginResponse: Codable {
    var success: Bool?
    var expires_at: String?
    var request_token: String? 
}





