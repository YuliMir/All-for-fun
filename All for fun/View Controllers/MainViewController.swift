//
//  MainViewController.swift
//  All for fun
//
//  Created by Юлия Миронова on 14.06.2022.
//

import UIKit

enum UserAction: String, CaseIterable {
    case phrases = "Phrases"
    case pictures = "Pictures"
}

enum UrlExamples: String {
    case phrasesUrl = "https://api.chucknorris.io/jokes/random"
    case picturesUrl = "https://random.dog/woof.json"
}

class MainViewController: UICollectionViewController {
    
    let userActions = UserAction.allCases
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        let userAction = userActions[indexPath.item]
        cell.userActionLabel.text = userAction.rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .phrases: performSegue(withIdentifier: "showSegue", sender: nil)
        case .pictures: performSegue(withIdentifier: "getPhotoSegue", sender: nil)
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_collectionview: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}




 

