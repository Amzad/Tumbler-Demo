//
//  FullScreenPhotoViewController.swift
//  TumblerFeed
//
//  Created by Amzad Chowdhury on 9/19/18.
//  Copyright © 2018 Amzad Chowdhury. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {

    var image:UIImage!
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        photoView.image = image
    
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
