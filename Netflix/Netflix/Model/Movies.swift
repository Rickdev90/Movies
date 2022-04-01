//
//  Movies.swift
//  Netflix
//
//  Created by Rick on 30/03/22.
//

import Foundation

struct Movies: Codable {
    let page: Int?
    let results: [Movie]?
    let total_pages, total_results: Int?
}

struct Movie: Codable {
    let backdrop_path: String?
    let first_air_date: String?
    let genre_ids: [Int]?
    let id: Int?
    let name: String?
    let origin_country: [String]?
    let original_language, original_name, overview: String?
    let popularity: Double?
    let poster_path: String?
    let vote_average: Double?
    let vote_count: Int?
}
