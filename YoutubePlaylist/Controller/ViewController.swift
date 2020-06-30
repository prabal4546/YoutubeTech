//
//  ViewController.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 27/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //confirm the video was selected
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
        
        //get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a reference to detailViewController
        let detailVC = segue.destination as! DetailViewController
        
        //set the Video property of detailVC
        detailVC.video = selectedVideo
    }
    //MARK:-ModelDelegate methods
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
    }
    
    //MARK:-TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with data
        let video = videos[indexPath.row]
        cell.setCelll(video)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }


}

