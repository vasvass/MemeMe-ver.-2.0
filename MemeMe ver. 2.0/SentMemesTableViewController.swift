//
//  SentMemesTableViewController.swift
//  MemeMe ver. 2.0
//
//  Created by Vassileios Vassileiades on 30/3/20.
//  Copyright © 2020 Vassileios Vassileiades. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController  {
    
    private let reuseIdentifier = "MemeTableViewCell"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    // MARK: Application States
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tableView.allowsMultipleSelectionDuringEditing = false
        self.tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Update table view with new data before view will appear
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText + " ... " + meme.bottomText
        cell.clipsToBounds = true
        
        return cell
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = ((UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row])
        
        navigationController!.pushViewController(detailController, animated: true)
    }

   override  func tableView(_ tableView: UITableView, commit editingAction: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingAction == .delete {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
