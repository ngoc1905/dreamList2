//
//  ItemCell.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var nameItem: UILabel!
    
    @IBOutlet weak var priceItem: UILabel!

    @IBOutlet weak var desciptionItem: UILabel!
    
    func configureCell(item :Item) {
    
        self.nameItem.text = item.title;
        self.priceItem.text = "\(item.price)";
        self.desciptionItem.text = item.details;
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
