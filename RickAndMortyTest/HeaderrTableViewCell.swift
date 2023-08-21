//
//  HeaderrTableViewCell.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import UIKit

class HeaderrTableViewCell: UITableViewCell {
    
    private let characterImageView = UIImageView(frame: .zero)
    private let nameLabel = UILabel(frame: .zero)
    private let statusLabel = UILabel(frame: .zero)
    
    private let networkManager = NetworkManager.shared

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        
        self.characterImageView.layer.masksToBounds = true
        self.characterImageView.layer.cornerRadius = 16
        
        self.nameLabel.font = UIFont(name: "Gilroy", size: 22)
        self.nameLabel.textColor = .white
        self.statusLabel.font = UIFont(name: "Gilroy", size: 16)
        
        self.characterImageView.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.characterImageView)
        
        NSLayoutConstraint.activate([
            self.characterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.characterImageView.heightAnchor.constraint(equalToConstant: 148),
            self.characterImageView.widthAnchor.constraint(equalToConstant: 148),
            self.characterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(self.nameLabel)
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.characterImageView.bottomAnchor, constant: 24),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 25),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(self.statusLabel)
        
        NSLayoutConstraint.activate([
            self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 20),
            self.statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func setupCell(character: Character) {
        self.nameLabel.text = character.name
        self.statusLabel.text = character.status
        
        if character.status == "Alive" {
            self.statusLabel.textColor = #colorLiteral(red: 0.3242220879, green: 0.7996779084, blue: 0.03119211644, alpha: 1)
        } else {
            self.statusLabel.textColor = .red
        }
        
        DispatchQueue.main.async {
            
            self.networkManager.fetchImage(from: character.image) { data, response in
                self.characterImageView.image = UIImage(data: data)
            }
        }
        
    }
}
