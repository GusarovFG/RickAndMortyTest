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
    
    private var data: RickAndMorty?
    private var characters: [Character] = []
    private var beginFetch = false
    
    private let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
        DispatchQueue.global().async {
            
            self.networkManager.fetchCharacters(from: URLS.rickAndMortyapi.rawValue) { result in
                self.data = result
                self.characters = result.results
                self.charactersCollectionView.reloadData()
            }
        }
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
    
    private func fetchNextCharacters() {
        self.beginFetch = true
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.0) {
            self.networkManager.fetchCharacters(from: self.data?.info.next) { ricksAndMorteys in
                
                self.data = ricksAndMorteys
                self.characters.append(contentsOf: ricksAndMorteys.results.compactMap{$0})
                self.charactersCollectionView.reloadData()
                self.beginFetch = false
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharactersCollectionViewCell
        let character = self.characters[indexPath.row]
        cell.setupUI(character: character)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 16) / 2, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        let detailVC = DetailTableViewController(character: character)
        
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offSetY > contentHeight - scrollView.frame.height {
            if !self.beginFetch {
                self.fetchNextCharacters()
            }
        }
    }
}
