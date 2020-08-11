//
//  ViewController.swift
//  Stocks
//
//  Created by Shubham Vinod Kamdi on 11/08/20.
//

import UIKit

class ViewController: UIViewController {

    var tabbar: UITabBar!
    var item1: UITabBarItem!
    var item2: UITabBarItem!
    var item3: UITabBarItem!
    var item4: UITabBarItem!
    var item5: UITabBarItem!
    
    var table: UITableView!
    
    var viewNav: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar = UITabBar()
        table = UITableView(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 60))
        
        viewNav = UIView()
        
        item1 = UITabBarItem(title: "", image: UIImage(named: ""), tag: 0)
        item2 = UITabBarItem(title: "", image: UIImage(named: ""), tag: 1)
        item3 = UITabBarItem(title: "", image: UIImage(named: ""), tag: 2)
        item4 = UITabBarItem(title: "", image: UIImage(named: ""), tag: 3)
        item5 = UITabBarItem(title: "", image: UIImage(named: ""), tag: 4)
        
        tabbar.items = [item1, item2, item3, item4, item5]
        
        tabbar.translatesAutoresizingMaskIntoConstraints = false
              
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        self.navigationItem.title = "The title"
        
        self.view.addSubview(table)
        self.view.addSubview(tabbar)
        self.view.addSubview(navigationBar)
        
        let horizontalConstraint = NSLayoutConstraint(item: tabbar!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        let bottom = NSLayoutConstraint(item: tabbar!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        let lead = NSLayoutConstraint(item: tabbar!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: -5)
        
        let trailing = NSLayoutConstraint(item: tabbar!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: +5)
        
        let height = NSLayoutConstraint(item: tabbar!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.065, constant: 0)
        
        let table_leading = NSLayoutConstraint(item: table!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)

        let table_trailing = NSLayoutConstraint(item: table!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)


        let table_bottom = NSLayoutConstraint(item: table!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)

        

        let table_top = NSLayoutConstraint(item: table!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 60)
        
        
        
        NSLayoutConstraint.activate([ horizontalConstraint, bottom, lead, trailing, height,table_leading, table_trailing, table_bottom, table_top])
        tabbar.selectedItem = item1
        table.register(table_cell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 110
        self.title = "Explore"
       //  Do any additional setup after loading the view.
    }

    
    override func viewDidLayoutSubviews() {
              
              let numberOfItems = CGFloat(tabbar.items!.count)
              let screenSize: CGRect = UIScreen.main.bounds
              let tabBarItemSize = CGSize(width: screenSize.width / numberOfItems, height: tabbar.frame.height)
              //self.size = tabBarItemSize
              var imgRed = UIImage()
                
              imgRed = UIImage.from(color: UIColor(rgb: 0x4E4FCF), size: tabBarItemSize).resizableImage(withCapInsets: .zero)
                tabbar.selectionIndicatorImage = imgRed
              tabbar.invalidateIntrinsicContentSize()
              
          }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! table_cell
        cell.index = indexPath.row
        if indexPath.row == 0{
            cell.card.backgroundColor = UIColor(rgb: 0xA5A4FD)
            cell.img.image = UIImage(named: "risk")
            cell.label.text = "Stocks"
        }else if  indexPath.row == 1{
            cell.card.backgroundColor = UIColor(rgb: 0x4E4FCF)
            cell.img.image = UIImage(named: "risk")
            cell.label.text = "ETFs"
        }else{
            cell.card.backgroundColor = UIColor(rgb: 0xFED73D)
            cell.img.image = UIImage(named: "risk")
            cell.label.text = "Crypto"
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.33, execute: {
            UIView.animate(withDuration: 0.5, delay: 0,options: .curveEaseIn, animations: {
                cell.contentView.alpha = 1
                cell.contentView.transform = CGAffineTransform.identity
                
            })
           
        })
        return cell

    }
    
    
}


class table_cell: UITableViewCell{
    let card = CardView()
    let label = UILabel()
    let img = UIImageView()
    var index: Int = 0
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(card)
        card.addSubview(img)
        card.addSubview(label)
        card.CornerRadiusCard = 37
        contentView.alpha = 0
        card.shadowColor = .darkGray
        
        contentView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        
        let card_leading = NSLayoutConstraint(item: card, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15)
        
        let card_trailing = NSLayoutConstraint(item: card, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -15)
        
        let card_bottom = NSLayoutConstraint(item: card, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        
        let card_top = NSLayoutConstraint(item: card, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        let card_height =  NSLayoutConstraint(item: card, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.67, constant: 0)
        
        
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 30, height: 30))
        img.layer.cornerRadius = img.frame.height / 2
        img.clipsToBounds = true
        img.layer.borderWidth = 1.2
        img.layer.borderColor = UIColor.white.cgColor
        label.font = UIFont.systemFont(ofSize: 27, weight: .medium)
        label.textColor = .white
        
        
        
        let img_centre =  NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: card, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        let img_leading = NSLayoutConstraint(item: img, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: card, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 40)
        
        let label_leading =  NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: img, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 55)
        
        let label_center = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: img, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([card_leading, card_trailing, card_bottom, card_top, card_height, img_centre, img_leading, label_leading, label_center])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



