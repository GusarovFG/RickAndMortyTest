//
//  CharactersCollectionViewCell.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/20/23.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    private var characterImage = UIImageView(frame: .zero)
    private var nameLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.1976234317, green: 0.219899714, blue: 0.2836517096, alpha: 1)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
        
        self.layer.cornerRadius = 16
        self.characterImage.layer.cornerRadius = 10
    }
    
   func setupUI(image: UIImage, name: String) {
        
        self.characterImage.image = image
        self.nameLabel.text = name
       self.nameLabel.textColor = .white
       self.nameLabel.textAlignment = .center
    }
    
    private func setupConstraint() {
        
        self.addSubview(self.characterImage)
        self.addSubview(self.nameLabel)
        
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.characterImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.characterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.characterImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.characterImage.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.characterImage.bottomAnchor, constant: 16),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 29),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
