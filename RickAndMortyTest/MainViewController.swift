//
//  ViewController.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/20/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private var charactersCollectionView: UICollectionView!
    private var backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.createConstraints()
    }
    
    private func setupViews() {
        
        self.view.backgroundColor = self.backgroundColor
        
        self.title = "Characters"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 0)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(ciColor: .white)]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(ciColor: .white)]
        
        let flowLayout = UICollectionViewFlowLayout()
        self.charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.charactersCollectionView.backgroundColor = self.backgroundColor
        
        self.charactersCollectionView.delegate = self
        self.charactersCollectionView.dataSource = self
        self.charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

    }
    
    private func createConstraints() {
        
        self.view.addSubview(self.charactersCollectionView)
        self.charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.charactersCollectionView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 31),
            self.charactersCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.charactersCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.charactersCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
        
        
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharactersCollectionViewCell
        cell.setupUI(image: UIImage(systemName: "eye")!, name: "Жопа")
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 16) / 2, height: 202)
    }
    
}
