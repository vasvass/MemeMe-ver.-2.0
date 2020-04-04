//
//  SentMemesCollectionViewController.swift
//  MemeMe ver. 2.0
//
//  Created by Vassileios Vassileiades on 30/3/20.
//  Copyright © 2020 Vassileios Vassileiades. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MemeCollectionViewCell"

class SentMemesCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        
        // Update collection view with new data before view will appear
       collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
      //  self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

            // Flow Layout
            let space:CGFloat = 3.0
            let dimension = (collectionView.frame.size.width - (2 * space)) / 3.0
            
            flowLayout.minimumInteritemSpacing = space
            flowLayout.minimumLineSpacing = space
            flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        
        let meme = self.memes[indexPath.item]
        
        cell.memeImageView?.image = meme.memedImage
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
      
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = ((UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row])
        navigationController!.pushViewController(detailController, animated: true)
    }

}
