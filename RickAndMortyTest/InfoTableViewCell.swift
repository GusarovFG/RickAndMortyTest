//
//  InfoTableViewCell.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    private let speciesLabel = UILabel(frame: .zero)
    private let speciesStatusLabel = UILabel(frame: .zero)
    private let typeLabel = UILabel(frame: .zero)
    private let typeStatusLabel = UILabel(frame: .zero)
    private let genderLaber = UILabel(frame: .zero)
    private let genderStatusLabel = UILabel(frame: .zero)
    private let stackView = UIStackView(frame: .zero)

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.speciesLabel.text = "Species:"
        self.typeLabel.text = "Type:"
        self.genderLaber.text = "Gender:"
        
        self.speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.speciesStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.typeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.typeStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.genderLaber.translatesAutoresizingMaskIntoConstraints = false
        self.genderStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        
        self.addSubview(self.stackView)
        
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fillEqually
        self.backgroundColor = #colorLiteral(red: 0.1976234317, green: 0.219899714, blue: 0.2836517096, alpha: 1)

    
        self.stackView.spacing = 0
        
        self.stackView.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
        self.setupLabels(mainLabel: self.speciesLabel, statusLabel: self.speciesStatusLabel)
        self.setupLabels(mainLabel: self.typeLabel, statusLabel: self.typeStatusLabel)
        self.setupLabels(mainLabel: self.genderLaber, statusLabel: self.genderStatusLabel)
        
        print("sdafsdf")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(character: Character) {
        
        self.speciesStatusLabel.text = character.species
        self.typeStatusLabel.text = character.status
        self.genderStatusLabel.text = character.gender
        
        self.speciesLabel.text = character.species
        self.typeLabel.text = character.status
        self.genderLaber.text = character.gender

    }
    
    private func setupLabels(mainLabel: UILabel, statusLabel: UILabel) {
        if self.stackView.arrangedSubviews.count < 3 {
            
            let backView = UIView(frame: .zero)
            
            self.stackView.addArrangedSubview(backView)
            
            backView.addSubview(mainLabel)
            backView.addSubview(statusLabel)
            
            backView.translatesAutoresizingMaskIntoConstraints = false
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            statusLabel.translatesAutoresizingMaskIntoConstraints = false
            
            mainLabel.font = UIFont(name: "Gilroy", size: 16)
            mainLabel.textColor = .white
            
            statusLabel.font = UIFont(name: "Gilroy", size: 16)
            statusLabel.textColor = .white
            
            NSLayoutConstraint.activate([
                
                backView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 0),
                backView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 0),
                backView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                mainLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 0),
                mainLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 0),
                mainLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                statusLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 0),
                statusLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 0),
                statusLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 0)
            ])
            
        }
    }

}
