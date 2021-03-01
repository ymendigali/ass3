//
//  CartViewController.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 05.02.2021.
//

import UIKit

protocol AddItemToCard {
    func addItemForBuy(item : Item)
}

class CartViewController: UIViewController{

    var delegate : CartViewController?
   
    @IBOutlet weak var tableVIew: UITableView!
    var firstItem = Item(title: "Asus Rog", decription: "Asus discription", price: "$100", image: "asus")
    var secondItem = Item(title: "HP", decription: "HP discription", price: "$100", image: "hp")
    var thirdItem = Item(title: "Legion", decription: "Legion discription", price: "$100", image: "legion")
    var fourthItem = Item(title: "Mackbook", decription: "Mackbook discription", price: "$100", image: "mackbook")
    var items : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItems()
        configTable()
    }
    
    func addItems()  {
        items.append(firstItem)
        items.append(secondItem)
        items.append(thirdItem)
        items.append(fourthItem)
    }
    func configTable(){
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(BuyTableViewCell.nib, forCellReuseIdentifier: BuyTableViewCell.identifider)
    }
     
}

extension CartViewController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BuyTableViewCell.identifider , for: indexPath) as! BuyTableViewCell
        
        cell.backgroundColor = .gray
      
        cell.commonInit(items[indexPath.row])

        return cell
    }

    
}


