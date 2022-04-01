//
//  HomeViewController.swift
//  Netflix
//
//  Created by Rick on 30/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieCollection: UICollectionView!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    var viewModelHome = ViewModelHome()
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollection.dataSource = self
        movieCollection.delegate = self
        movieCollection.collectionViewLayout = UICollectionViewFlowLayout()
        configureView()
    }
    
    private func configureView() {
        viewModelHome.retriveMovieList()
        profileButton.action = #selector(showSimpleActionSheet)
        
    }
}



extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelHome.dataHomeResponse?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: (viewModelHome.dataHomeResponse?.results?[indexPath.row]) as! Movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MoviewDetailViewController {
            let selected = viewModelHome.dataHomeResponse?.results?[selectedRow!]
            destVC.nameMoview = selected?.name
            destVC.lenguage = selected?.first_air_date
            destVC.date = selected?.original_language
            destVC.voteA = String(format: "%.2f",selected?.vote_average ?? 0.0)
            destVC.resume = selected?.overview
            destVC.imageM = selected?.poster_path
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: movieCollection.bounds.width/2.2, height: movieCollection.bounds.height/1.8)
    }
}

