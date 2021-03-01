//
//  BuyTableViewCell.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 06.02.2021.
//

import UIKit

class BuyTableViewCell: UITableViewCell {

    static let identifider = String(describing: BuyTableViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var itemTitle = String()
    var itemDescription = String()
    var itemPrice = String()
    //var itemImage = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(_ item : Item){
        titleLable.text = item.title
        descriptionLabel.text = item.decription
        priceLabel.text = item.price
        itemImage.image = UIImage(named: item.image)
    }
}
