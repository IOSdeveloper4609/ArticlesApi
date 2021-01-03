//
//  Extentions.swift
//  NewsApi
//
//  Created by Азат Киракосян on 03.01.2021.
//

import UIKit


extension ViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath) as! CustomTableViewCell
        cell.setupWithModel(model: cellModels[indexPath.row])
        return cell
 
    }
}


extension ViewController: UITableViewDelegate { }
