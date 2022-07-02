//
//  HomeViewController.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.rowHeight = 82
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsSelection = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let homeViewModel = HomeViewModel()
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBinding()
        homeViewModel.requestData()
    }

}

private extension HomeViewController {
    
    func setupViews() {
        self.view.addSubviews([
            bgImage,
            shadowView,
            tableView,
            collectionView
        ])
        self.tableView.register(ProductCell.self,
                                forCellReuseIdentifier: String(describing: ProductCell.self))
        self.collectionView.register(CategoryCell.self,
                                     forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        collectionView.delegate = self
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            shadowView.topAnchor.constraint(equalTo: view.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 110),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
            
        ])
    }
    
    func setupBinding() {
        homeViewModel.categories.bind(to: collectionView.rx.items(cellIdentifier: String(describing: CategoryCell.self), cellType: CategoryCell.self)) {  (row,category,cell) in
            cell.photoView.kf.setImage(with: URL(string: category.url))
            cell.titleLabel.text = category.name
        }.disposed(by: disposeBag)
        
        homeViewModel.products.bind(to: tableView.rx.items(cellIdentifier: String(describing: ProductCell.self), cellType: ProductCell.self)) {  (row,product,cell) in
            cell.photoView.kf.setImage(with: URL(string: product.url))
            cell.titleLabel.text = product.name
        }.disposed(by: disposeBag)
    }
    
}

