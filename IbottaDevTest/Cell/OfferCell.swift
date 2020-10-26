//
//  OfferCell.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.
//

import UIKit

class OfferCell: UICollectionViewCell {
    
    var productImage = UIImageView()
    var imageContainer = UIView()
    var favImage = UIImageView()
    var currentValue = Title()
    var name = Detail()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        configureUI()
        setupConstraints()
    }
    
    private func configureUI(){
        
        imageContainer.backgroundColor = UIColor.colorFrom(hexString: "f2f3f6", alpha: 1)
        imageContainer.layer.cornerRadius = 5.0
        imageContainer.clipsToBounds = true
        self.addSubview(imageContainer)
        
        productImage.contentMode = .scaleAspectFit
        self.imageContainer.addSubview(productImage)
        
        favImage.image = UIImage(named: "fav1")
        self.imageContainer.addSubview(favImage)
        
        self.addSubview(currentValue)
        self.addSubview(name)
        
    }
    
    private func setupConstraints(){
        
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            imageContainer.topAnchor.constraint(equalTo: self.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.76)
        ])
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            productImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 6),
            productImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 6),
            productImage.bottomAnchor.constraint(equalTo:imageContainer.bottomAnchor, constant: -6),
            productImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -6)
        ])
        
        favImage.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            favImage.topAnchor.constraint(equalTo: productImage.topAnchor),
            favImage.trailingAnchor.constraint(equalTo: productImage.trailingAnchor),
            favImage.widthAnchor.constraint(equalToConstant: 20),
            favImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        currentValue.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            currentValue.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 8),
            currentValue.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            currentValue.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor)
        ])
        
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            name.topAnchor.constraint(equalTo: currentValue.bottomAnchor, constant: 3),
            name.leadingAnchor.constraint(equalTo: currentValue.leadingAnchor, constant: 0),
            name.trailingAnchor.constraint(equalTo: currentValue.trailingAnchor, constant: 0),
            name.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0)
        ])
        
    }
    
}
