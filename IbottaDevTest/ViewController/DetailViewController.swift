//
//  DetailViewController.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageView = UIImageView()
    var btnFavorite = UIButton()
    var currentValueLabel = Title()
    var nameLabel =  Title()
    var termsLabel =  Detail()
    var descriptionlLabel =  Detail()
    
    var offer:Offer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Detail"
        self.view.backgroundColor = .white
        configureUI()
        setupContraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func configureUI(){
        
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        btnFavorite.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
        self.btnFavorite.setImage(UIImage(named: "fav2"), for: .normal)
        self.btnFavorite.setImage(UIImage(named: "fav1"), for: .selected)
        self.btnFavorite.isSelected = offer.isFavorite
        self.view.addSubview(btnFavorite)
        
        self.view.addSubview(currentValueLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionlLabel)
        self.view.addSubview(termsLabel)
        
        descriptionlLabel.numberOfLines = 0
        termsLabel.numberOfLines = 0
        
        setData()
        
    }
    
    @objc func didTapFavorite(){
        
        offer.isFavorite = offer.isFavorite ? false : true
        self.btnFavorite.isSelected = offer.isFavorite
        
    }
    
    private func setupContraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        btnFavorite.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            btnFavorite.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 6),
            btnFavorite.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -6),
            btnFavorite.widthAnchor.constraint(equalToConstant: 40),
            btnFavorite.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.setLabelConstraint(toLabel: currentValueLabel, fromLabel: imageView)
        self.setLabelConstraint(toLabel: nameLabel, fromLabel: currentValueLabel)
        self.setLabelConstraint(toLabel: descriptionlLabel, fromLabel: nameLabel)
        self.setLabelConstraint(toLabel: termsLabel, fromLabel: descriptionlLabel)
    }
    
    func setLabelConstraint(toLabel: UILabel, fromLabel: Any){
        
        toLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            toLabel.topAnchor.constraint(equalTo: (fromLabel as AnyObject).bottomAnchor, constant: 5),
            toLabel.leadingAnchor.constraint(equalTo: (fromLabel as AnyObject).leadingAnchor),
            toLabel.trailingAnchor.constraint(equalTo: (fromLabel as AnyObject).trailingAnchor)
        ])
    }
    
    private func setData(){
        
        if let url = offer.url{
            let url = URL(string: url)
            imageView.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
        }

        currentValueLabel.attributedText = NSAttributedString.underLine(mainString: "Current Value: " + offer.currentValue, subString: "Current Value:", fontName: AvenirNext_DemiBold, fontSize: LabelTitle_Size)
        nameLabel.attributedText = NSAttributedString.underLine(mainString: "Name: " + (offer.name ?? ""), subString: "Name:", fontName: AvenirNext_DemiBold, fontSize: LabelTitle_Size)
        descriptionlLabel.attributedText = NSAttributedString.underLine(mainString: "Description: " + offer.description, subString: "Description:", fontName: AvenirNext_Regular, fontSize: LabelDetail_Size)
        termsLabel.attributedText = NSAttributedString.underLine(mainString: "Terms: " + offer.terms, subString: "Terms:", fontName: AvenirNext_Regular, fontSize: LabelDetail_Size)
        
    }
}
