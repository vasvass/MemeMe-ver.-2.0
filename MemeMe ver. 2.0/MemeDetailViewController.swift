//
//  MemeDetailViewController.swift
//  MemeMe ver. 2.0
//
//  Created by Vassileios Vassileiades on 1/4/20.
//  Copyright © 2020 Vassileios Vassileiades. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }

}
