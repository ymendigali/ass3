//
//  ViewController.swift
//  Assignment3
//
//  Created by Yersultan Mendigali on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewChangeBtn: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var firstItem = Item(title: "Asus Rog", decription: "Asus discription", price: "$100", image: "asus")
    var secondItem = Item(title: "HP", decription: "HP discription", price: "$100", image: "hp")
    var thirdItem = Item(title: "Legion", decription: "Legion discription", price: "$100", image: "legion")
    var fourthItem = Item(title: "Mackbook", decription: "Mackbook discription", price: "$100", image: "mackbook")
    var items : [Item] = []
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.isHidden = false
        addItems()
        collectionView.isHidden = true
        configTable()
    }
    
    func addItems()  {
        items.append(firstItem)
        items.append(secondItem)
        items.append(thirdItem)
        items.append(fourthItem)
    }
     
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifider)
        tableView.register(ViewTableCell.nib, forCellReuseIdentifier: ViewTableCell.identifider)
        
        tableView.tableFooterView = UIView()
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewTableCell.identifider , for: indexPath) as! ViewTableCell
      
        cell.commonInit(items[indexPath.row])

        return cell
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "ItemDetailViewController") as? ItemDetailViewController{
            
            vc.productTitle = items[indexPath.row].title
            vc.productImage = UIImage(named: items[indexPath.row].image)!
            vc.productPrice = items[indexPath.row].price
            vc.productDescription = items[indexPath.row].decription
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}


extension ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        
        if !tableView.isHidden {
            tableView.isHidden = true
            collectionView.isHidden = false
        }else{
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    
    }

}

extension ViewController : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifider , for: indexPath) as! CollectionViewCell
        
        cell.commonInit(items[indexPath.row])
        
        return cell
    }
  
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width = self.view.bounds.width / 2
        
        return CGSize(width: 200, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "ItemDetailViewController") as? ItemDetailViewController{
            
            vc.productTitle = items[indexPath.row].title
            vc.productImage = UIImage(named: items[indexPath.row].image)!
            vc.productPrice = items[indexPath.row].price
            vc.productDescription = items[indexPath.row].decription
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

