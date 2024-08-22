//
//  WebViewController.swift
//  MovieList
//
//  Created by Apple on 22.08.2024.
//

import Foundation
import UIKit
import WebKit

class WebViewController:UIViewController {
    
    var selectedMovieIndex: Int = 0
    var selectedMovie: Movie!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("selected movie\(selectedMovieIndex)")
        selectedMovie = movieList[selectedMovieIndex]
        loadYoutube(videoURL: selectedMovie.trailer)
        print("trailer url : " + selectedMovie.trailer)
    }
    
    func loadYoutube(videoURL: String){
        if let youtubeUrl = URL(string: videoURL){
            webView.load(URLRequest(url: youtubeUrl))
        }
        else{ return }
        
    }
    
    @IBAction func CloseAction(_ sender: Any) {
        self.dismiss(animated: true)
        print("dismissed!")
    }
    
}
