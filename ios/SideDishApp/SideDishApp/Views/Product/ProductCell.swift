//
//  ProductCell.swift
//  SideDishApp
//
//  Created by Cory Kim on 2020/04/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    static let identifier = "product"

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabelsStackView: PriceLabelsStackView!
    @IBOutlet weak var badgeLabelsStackView: BadgeLabelsStackView!
    
    private var loadingColor: UIColor? = UIColor(named: "loading-color")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureImageView()
    }
    
    func configureProductImage(_ image: UIImage?) {
        self.productImageView.image = image
    }
    
    func configureProductCell(with product: Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        if product.badges?.count == 0 {
            badgeLabelsStackView.configureBadges(nil)
        } else {
            badgeLabelsStackView.configureBadges(product.badges)
        }
        priceLabelsStackView.configurePriceLabels(originalPrice: product.originalPrice, finalPrice: product.finalPrice)
    }
    
    private func configureImageView() {
        productImageView.backgroundColor = loadingColor
        productImageView.layer.cornerRadius = productImageView.frame.height / 2
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
    }
}
