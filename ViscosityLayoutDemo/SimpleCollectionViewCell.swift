//
//  SimpleCollectionViewCell.swift
//  ViscosityLayoutDemo
//
//  Created by Yiyin Shen on 3/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class SimpleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
