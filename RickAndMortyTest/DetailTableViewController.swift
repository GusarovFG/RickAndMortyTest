//
//  DetailTableViewController.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    private var character: Character!
    private var characterImage: UIImage?
    
    private let networkManager = NetworkManager.shared
    
    init(character: Character) {
        
        self.character = character
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .insetGrouped)
        self.tableView.register(HeaderrTableViewCell.self, forCellReuseIdentifier: "header")
        self.tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "info")
        self.tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: "origin")
        self.tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: "episode")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
        self.view.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.04705882353, blue: 0.1176470588, alpha: 1)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0...2:
            return  1
        case 3:
            return self.character?.episode.count ?? 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath {
        case [0,0]:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! HeaderrTableViewCell
            headerCell.setupCell(character: self.character)
            
            return headerCell
        case[1,0]:
            let infoCell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! InfoTableViewCell
            infoCell.setupCell(character: self.character)
            
            return infoCell
        case [2,0]:
            let originCell = tableView.dequeueReusableCell(withIdentifier: "origin", for: indexPath) as! OriginTableViewCell
            originCell.setupCell(character: self.character)
            
            return originCell
            
        default:
            let episodeCell = tableView.dequeueReusableCell(withIdentifier: "episode", for: indexPath) as! EpisodesTableViewCell
            episodeCell.setupCell(character: self.character, url: self.character.episode[indexPath.row])
            
            return episodeCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case [0,0]:
            return 265
        case [1,0]:
            return 124
        case [2,0]:
            return 80
        default:
            return 86
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Info"
        case 2:
            return "Origin"
        case 3:
            return "Episodes"
        default:
            return nil
            
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.textLabel?.font = UIFont(name: "Gilroy", size: 17)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
