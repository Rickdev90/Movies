//
//  MoviewDetailViewController.swift
//  Netflix
//
//  Created by Rick on 31/03/22.
//

import UIKit

class MoviewDetailViewController: UIViewController {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var lenguageLabel: UILabel!
    @IBOutlet weak var voteLbl: UILabel!
    @IBOutlet weak var dateAirLbl: UILabel!
    @IBOutlet weak var resumeLbl: UILabel!
    
    
    var nameMoview : String?
    var lenguage: String?
    var voteA: String?
    var date: String?
    var resume: String?
    var imageM: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView(){
        titleLbl.text = nameMoview
        lenguageLabel.text = lenguage
        voteLbl.text = voteA
        dateAirLbl.text = date
        resumeLbl.text = resume
        guard let path = imageM else {return}
        imageMovie.imageFromServerURL(urlString: Constants.urlImages + path, placeHolderImage: UIImage(named: "movieplace")!)
        
    }
    
}
