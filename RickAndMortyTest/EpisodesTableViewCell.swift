//
//  EpisodesTableViewCell.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    private let episodesNameLabel = UILabel(frame: .zero)
    private let numberOfEpisodeLabel = UILabel(frame: .zero)
    private let dateOfEpisodeLabel = UILabel(frame: .zero)
    
    private let networkManager = NetworkManager.shared

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 0.1976234317, green: 0.219899714, blue: 0.2836517096, alpha: 1)
        
        self.episodesNameLabel.font = UIFont(name: "Gilroy", size: 17)
        self.episodesNameLabel.textColor = .white
        
        self.numberOfEpisodeLabel.font = UIFont(name: "Gilroy", size: 13)
        self.numberOfEpisodeLabel.textColor = #colorLiteral(red: 0.3242220879, green: 0.7996779084, blue: 0.03119211644, alpha: 1)
        
        self.dateOfEpisodeLabel.font = UIFont(name: "Gilroy", size: 12)
        self.dateOfEpisodeLabel.textColor = #colorLiteral(red: 0.6425313354, green: 0.6608255506, blue: 0.6748523712, alpha: 1)
        
        self.addSubview(self.episodesNameLabel)
        self.addSubview(self.numberOfEpisodeLabel)
        self.addSubview(self.dateOfEpisodeLabel)
        
        self.episodesNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateOfEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.episodesNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.episodesNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.25)
        ])
        
        NSLayoutConstraint.activate([
            self.numberOfEpisodeLabel.topAnchor.constraint(equalTo: self.episodesNameLabel.bottomAnchor, constant: 16),
            self.numberOfEpisodeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.25)
        ])
        
        NSLayoutConstraint.activate([
            self.dateOfEpisodeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.dateOfEpisodeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.85)
        ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(character: Character, url: String) {
        DispatchQueue.global().async {
            self.networkManager.fetchEpisode(from: url) { episode in
                DispatchQueue.main.async {
                    self.episodesNameLabel.text = episode.name
                    self.numberOfEpisodeLabel.text = episode.episode
                    self.dateOfEpisodeLabel.text = episode.date
                }
            }
        }
        
    }

}
