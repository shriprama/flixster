//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Shriprama Rao on 2/17/19.
//  Copyright © 2019 Shriprama Rao. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    @IBAction func watchTrailerButtonPressed(_ sender: Any) {
        
    }
    
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let backdropPath = movie["backdrop_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        posterImageView.af_setImage(withURL: posterUrl!)
        backgroundImageView.af_setImage(withURL: backdropUrl!)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // find the selected movie
        let senderButton = sender as! UIButton
        
        // pass to the segue destination
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.movie = movie
        
        // tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
