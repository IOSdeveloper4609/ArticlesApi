//
//  ViewController.swift
//  NewsApi
//
//  Created by Азат Киракосян on 05.12.2020.
//

import UIKit

final class ViewController: UIViewController {

   
    private var tableView = UITableView()
    let Identifier = "Cell"
    private var apiService = ApiService()
    var cellModels = [ModelTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createTableView()
        getMoviesData()
        navigationItem.title = "Articles"
        navigationController?.navigationBar.barTintColor = .systemBlue
    }

    private func createTableView() {
        tableView.rowHeight = 140
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Identifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func getMoviesData() {
        
        apiService.getMovies(api: "\(URLArticles)") { results in
            var cellModels = [ModelTable]()
            
            for article in results.articles {
                let model = ModelTable(article: article)
                cellModels.append(model)
            }
            
            self.cellModels = cellModels
            self.tableView.reloadData()
        }
    }

}




