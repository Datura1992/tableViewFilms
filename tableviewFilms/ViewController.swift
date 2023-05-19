//
//  ViewController.swift
//  tableviewFilms
//
//  Created by Александра Иванова on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LabelFilm: UILabel!
    
    
    @IBOutlet weak var LabelAuthor: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    var film = ""
    var  author = ""
    var imagename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LabelFilm.text = film
        LabelAuthor.text = author
        ImageView.image = UIImage(named: imagename)
    }


}

