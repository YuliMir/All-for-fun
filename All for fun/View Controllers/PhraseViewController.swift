//
//  UserViewController.swift
//  All for fun
//
//  Created by Юлия Миронова on 29.06.2022.
//

import UIKit

class PhraseViewController: UIViewController {
    
    @IBOutlet var phraseLabel: UILabel!
    
    var url = UrlExamples.phrasesUrl.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPhrases()
    }
}

extension PhraseViewController {
    func fetchPhrases() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error)  in
            if let error = error {
                print (error)
                return
            }
            guard let data = data else {return}
            
            do {
                let somePhraze = try JSONDecoder().decode(ChuckNorris.self, from: data)
                
                guard let value = somePhraze.value else { return }
                DispatchQueue.main.async {
                    self.phraseLabel.text = value
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
