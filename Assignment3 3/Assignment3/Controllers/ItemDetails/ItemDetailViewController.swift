//
//  ItemDetailViewController.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 05.02.2021.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addCard: UIButton!
    
    var productImage = UIImage()
    var productTitle = ""
    var productDescription = ""
    var productPrice = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = productImage
        titleLable.text = productTitle
        descriptionLabel.text = productDescription
        priceLabel.text = productPrice
    }
    


}
