//
//  ProductCell.swift
//  boardshop
//
//  Created by Андрей Груненков on 02.07.2022.
//

import UIKit
import Kingfisher

final class ProductCell: UITableViewCell {
    
    let photoView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {}
    
}

extension ProductCell {
    
    func setupViews() {
        self.addSubviews([
            photoView,
            titleLabel
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            photoView.topAnchor.constraint(equalTo: contentView.safeTopAnchor, constant: 16),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoView.heightAnchor.constraint(equalToConstant: 50),
            photoView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: photoView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 16),
            
        ])
    }
    
}

