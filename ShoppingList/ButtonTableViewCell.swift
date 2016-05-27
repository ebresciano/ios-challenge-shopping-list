//
//  ButtonTableViewCell.swift
//  ShoppingList
//
//  Created by Eva Marie Bresciano on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var PrimaryLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    weak var delegate: ShoppingTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func didBuyValueChanged(value: Bool) {
        if value == true {
            Button.imageView?.image = UIImage(named: "complete")
        } else {
            Button.imageView?.image = UIImage(named: "incomplete")
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
        delegate.buttonCellButtonTapped(self)
        
        }
    }
}

protocol ShoppingTableViewCellDelegate: class {
    func buttonCellButtonTapped(cell: ButtonTableViewCell)
    
    
}

extension ButtonTableViewCell {
    
    func updateWithShopping(shopping: Shopping) {
        PrimaryLabel.text = shopping.name
        didBuyValueChanged(shopping.didBuy.boolValue)
    }
}

