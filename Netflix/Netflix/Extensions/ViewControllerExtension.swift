//
//  ViewControllerExtension.swift
//  Netflix
//
//  Created by Rick on 29/03/22.
//

import UIKit

fileprivate var activityView: UIView?

extension UIViewController{
    func showSpinner() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activity = UIActivityIndicatorView(style: .large)
        activity.center = activityView!.center
        activity.startAnimating()
        activityView?.addSubview(activity)
        let textLabel = UILabel(frame: CGRect(x: 0, y: self.view.bounds.height/3.3, width: self.view.bounds.width, height: self.view.bounds.height/2))
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.gray
        textLabel.text = "Conectando...."
        activityView?.addSubview(textLabel)
        self.view.addSubview(activityView!)
    }
    func removeSpinner(){
        activityView?.removeFromSuperview()
        activityView = nil
    }
    
    @objc func showSimpleActionSheet() {
        let alert = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "View Profile", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "segueProfile", sender: self)
            print("User click View Profile button")
        }))
        alert.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { (_) in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            print("User click Log out button")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User click Cancel button")
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

extension UIImageView {
    
    func imageFromServerURL(urlString: String, placeHolderImage: UIImage){
        if self.image == nil {
            self.image = placeHolderImage
        }
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let data = data else {return}
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}


