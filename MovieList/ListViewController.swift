//
//  ListViewController.swift
//  MovieList
//
//  Created by Apple Egitim on 4.09.2024.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout   {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as! MovieTwoColumnCell
        let movie = movieList[indexPath.row]
        cell.setup(movie: movie)
        print("title:" + movie.title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 20
        let collectionViewSize = myCollectionView.frame.size.width - padding
        
        let itemWidth = collectionViewSize /  2
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as! MovieTwoColumnCell
        
        cell.movieImage.frame = CGRect(x: 0, y: 0, width: itemWidth, height: (16/9)*itemWidth)
        
        cell.movieName.frame = CGRect(x: 0, y: (16/9), width: 70, height: 20)
        
        
        return CGSize(width: itemWidth , height: (16/9) * itemWidth)
        
    }
}
