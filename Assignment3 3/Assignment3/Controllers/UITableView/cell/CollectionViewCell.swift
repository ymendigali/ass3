//
//  CollectionViewCell.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 05.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifider = String(describing: CollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    @IBOutlet weak var imageCollectionView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cardBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func commonInit(_ item : Item){
        titleLabel.text = item.title
        descriptionLabel.text = item.decription
        price.text = item.price
        imageCollectionView.image = UIImage(named: item.image)
    }

}
