//
//  MovieCollectionViewCell.swift
//  Netflix
//
//  Created by Rick on 30/03/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateStreno: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var resumeLabel: UILabel!
    
    
    func setup(with movie: Movie){
     
        contentCell.layer.cornerRadius = contentCell.frame.width/8
        contentCell.clipsToBounds = true
        nameLabel.text = movie.name
        dateStreno.text = movie.first_air_date
        resumeLabel.text = movie.overview
        voteAverage.text = String(format: "%.2f",movie.vote_average ?? 0.0)
        guard let path = movie.poster_path else {return}
        movieImageView.imageFromServerURL(urlString: Constants.urlImages + path, placeHolderImage: UIImage(named: "movieplace")!)
    }
    
}



