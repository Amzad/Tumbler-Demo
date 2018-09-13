//
//  PhotosViewController.swift
//  TumblerFeed
//
//  Created by Amzad Chowdhury on 9/12/18.
//  Copyright © 2018 Amzad Chowdhury. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts: [[String: Any]] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Running")
        tableView.dataSource = self
        tableView.delegate = self
        fetchImages()

        // Do any additional setup after loading the view.
    }
    
    func fetchImages() {
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Unable to Connect", message: "No network connection", preferredStyle: .alert)
                let tryAgainAction = UIAlertAction(title: "Try again", style: .default, handler: {
                    (action) in self.fetchImages()
                })
                alertController.addAction(tryAgainAction)
                self.present(alertController, animated: true) {
                
                }
                
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // print("Found")
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                self.tableView.reloadData()
            }
        }
        task.resume()
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        // print("Running Cell")
        let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            // print(urlString)
            cell.photoView.af_setImage(withURL: url!)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
