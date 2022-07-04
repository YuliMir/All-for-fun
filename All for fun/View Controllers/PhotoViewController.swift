//
//  GetPhotoViewController.swift
//  All for fun
//
//  Created by Юлия Миронова on 30.06.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var imageView: UIImageView!
    
    var imageDog = UrlExamples.picturesUrl.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchImage()
    }
}

extension PhotoViewController {
    func fetchImage() {
        guard let url = URL(string: imageDog) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error)  in
            if let error = error {
                print (error)
                return
            }
            guard let data = data else {return}
            
            do {
                let someImage = try JSONDecoder().decode(Cats.self, from: data)
                guard let stringURL = someImage.url,
                      let imageURL = URL(string: stringURL)else {return}
                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.activityIndicator.stopAnimating()
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
