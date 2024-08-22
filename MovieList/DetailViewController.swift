//
//  DetailViewController.swift
//  MovieList
//
//  Created by Apple on 21.08.2024.
//

import Foundation
import UIKit

class DetailViewController:UIViewController {
    
    var selectedIndex:Int = 0
    
    @IBOutlet var movieName:UILabel!
    @IBOutlet var duration:UILabel!
    @IBOutlet var ratingLabel:UILabel!
    @IBOutlet var releaseDate:UILabel!
    @IBOutlet var genre:UILabel!
    @IBOutlet var desc:UITextView!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SELECTED INDEX: \(selectedIndex)" )
        let movie:Movie = movieList[selectedIndex]
        print("SELECTED MOVIE: " + movie.title)
        
        if let temp = movie.image {
            movieImageView.image = temp
        }
        if let temp = movie.title {
            movieName.text = temp
        }
        if let temp = movie.duration {
            duration.text = String(temp) + " Minutes"
        }
        if let temp = movie.rating {
            ratingLabel.text = String(temp)
        }
        if let temp = movie.releaseDate {
            releaseDate.text = String(temp)
        }
        if let temp = movie.genre {
            genre.text = String(temp)
        }
        if let temp = movie.desc {
            desc.text = String(temp)
        }
       
        
    }
    
    @IBAction func watchTrailer(_ sender: Any) {
        
        loadWebView()
    }
    @IBAction func movieStartButton(_ sender: Any) {
        
        loadWebView()
    }
    
    
    func loadWebView(){
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let webViewController: WebViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            webViewController.selectedMovieIndex = selectedIndex
            webViewController.modalPresentationStyle = .popover
                
            self.present(webViewController, animated: true, completion: nil)
        
    }
}
