//
//  CoverFlowCell.swift
//  CoverFlow
//
//  Created by projas on 5/18/16.
//  Copyright © 2016 projas. All rights reserved.
//

import UIKit

class CoverFlowCell: UICollectionViewCell {

    @IBOutlet weak var imageCover: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addShadowsToImageCover()
        
    }
    
    
    func addShadowsToImageCover() {
        imageCover.layer.shadowColor = UIColor.whiteColor().CGColor
        imageCover.layer.shadowOpacity = 3.0
        imageCover.layer.shadowOffset = CGSizeMake(3.0, 3.0)
    }
    
    static func reuseIdentifier() -> String{
        return "CoverFlowCell"
    }

}
