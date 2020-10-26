//
//  ProductViewController.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.

import UIKit
import SDWebImage

public class ProductViewController: UIViewController {
    
    var serviceManager = ServiceManager()
    
    //MARK:-OutLets
    var offers = [Offer]()
    let collectionVIew: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    //MARK: - Life Sycle
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureUI()
        self.setupContraints()
        
        if let localData = serviceManager.readLocalFile(forName: "Offers") {
            offers = serviceManager.parse(jsonData: localData) ?? []
        }
    }
    
    public func sum(a: Int, b: Int)->Int{
        
        return a + b
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.title = "Ibotta Offers"
        self.collectionVIew.reloadData()
        
    }
    
    //MARK: - User Defined
    private func configureUI(){
        
        collectionVIew.setCollectionViewLayout(layout, animated: true)
        collectionVIew.backgroundColor = .white
        collectionVIew.register(OfferCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(collectionVIew)
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
    }
    
    /// Set All constraints
    private func setupContraints(){
        
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            collectionVIew.topAnchor.constraint(equalTo: view.topAnchor),
            collectionVIew.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ProductViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.offers.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? OfferCell else {
            
            return UICollectionViewCell()
        }
        
        let data = offers[indexPath.row]
        if let url = data.url{
            
            let url = URL(string: url)
            cell.productImage.sd_setImage(with:url, placeholderImage: UIImage(named: "placeholder"))
        }
        
        cell.currentValue.text = data.currentValue
        cell.favImage.isHidden = data.isFavorite ? false : true
        cell.name.text = data.name
        
        return cell
        
    }
    
}

extension ProductViewController:UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.bounds.width/2.2, height: 200)
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 24.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12) // top, left, bottom, right
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.offer = offers[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
