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
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
