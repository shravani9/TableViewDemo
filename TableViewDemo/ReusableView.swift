//
//  ReusableView.swift
//  TableViewDemo
//
//  Created by Shravani on 03/02/21.
//

import UIKit

class ReusableView: UIView, UIGestureRecognizerDelegate {

    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet var reusableView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageToLike: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit(){
        let viewFromXib = Bundle.main.loadNibNamed("ReusableView", owner: self, options: nil)![0] as! UIView
                viewFromXib.frame = self.bounds
                addSubview(viewFromXib)
    }
}
