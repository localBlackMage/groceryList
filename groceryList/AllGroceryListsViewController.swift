//
//  MainViewController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class GroceryListCell: UITableViewCell {
    @IBOutlet var listNameLabel: UILabel?
    @IBOutlet var listCountLabel: UILabel?
}

class AllGroceryListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var groceryListsTableView: UITableView?
    
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadGroceryListData()
        groceryListsTableView?.reloadData()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.allGroceryListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GroceryListCell
        
        cell?.listNameLabel?.text = manager.getGroceryListName(from: indexPath)
        
        cell?.listCountLabel?.text = manager.getGroceryListCount(from: indexPath)?.stringValue
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedGroceryListIndex = indexPath.row
    }
}

