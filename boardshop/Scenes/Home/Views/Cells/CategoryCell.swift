//
//  CategoryCell.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import UIKit
import Kingfisher

final class CategoryCell: UICollectionViewCell {
    
    let photoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
}

extension CategoryCell {
    
    func setupViews() {
        addSubviews([
            photoView,
            titleLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photoView.topAnchor.constraint(equalTo: contentView.safeTopAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.heightAnchor.constraint(equalToConstant: 90),
            photoView.widthAnchor.constraint(equalToConstant: 90),
            
            titleLabel.centerXAnchor.constraint(equalTo: photoView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 5),
            
        ])
    }
    
}
