//
//  OriginTableViewCell.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import UIKit

class OriginTableViewCell: UITableViewCell {
    
    private let planetImageView = UIImageView()
    private let planetNameLabel = UILabel()
    private let planetLabel = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 0.1976234317, green: 0.219899714, blue: 0.2836517096, alpha: 1)
        
        self.planetNameLabel.font = UIFont(name: "Gilroy", size: 17)
        self.planetNameLabel.textColor = .white
        
        self.planetLabel.font = UIFont(name: "Gilroy", size: 17)
        self.planetLabel.textColor = .white


        self.addSubview(self.planetImageView)
        self.addSubview(self.planetNameLabel)
        self.addSubview(self.planetLabel)
        
        self.planetImageView.image = UIImage(named: "Planet")!
        self.planetImageView.contentMode = .center
        self.planetImageView.layer.cornerRadius = 10
        self.planetImageView.layer.masksToBounds = true

        
        self.planetLabel.text = "Planet"
        self.planetImageView.backgroundColor = .black
        
        
        
        self.planetImageView.translatesAutoresizingMaskIntoConstraints = false
        self.planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.planetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.planetImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.planetImageView.heightAnchor.constraint(equalToConstant: 64),
            self.planetImageView.widthAnchor.constraint(equalToConstant: 64),
            self.planetImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            self.planetNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.planetNameLabel.leadingAnchor.constraint(equalTo: self.planetImageView.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            self.planetLabel.topAnchor.constraint(equalTo: self.planetNameLabel.bottomAnchor, constant: 8),
            self.planetLabel.leadingAnchor.constraint(equalTo: self.planetImageView.trailingAnchor, constant: 16),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(character: Character) {
        self.planetNameLabel.text = character.origin.name
    }

}
