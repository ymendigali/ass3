//
//  ViewTableCell.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 03.02.2021.
//

import UIKit

class ViewTableCell: UITableViewCell {

    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    static let identifider = String(describing: ViewTableCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
            //round image
        self.itemImage.layer.cornerRadius = itemImage.frame.size.width / 2
        itemImage.clipsToBounds = true
        
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
