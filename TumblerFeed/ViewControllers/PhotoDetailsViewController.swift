//
//  PhotoDetailsViewController.swift
//  TumblerFeed
//
//  Created by Amzad Chowdhury on 9/19/18.
//  Copyright © 2018 Amzad Chowdhury. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func didTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let fullScreenViewController =  mainStoryboard.instantiateViewController(withIdentifier: "FullScreenPhotoViewController") as! FullScreenPhotoViewController
        
        /* set the image */
        fullScreenViewController.image = self.image
        
        /* trigger segue manually */
        present(fullScreenViewController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
