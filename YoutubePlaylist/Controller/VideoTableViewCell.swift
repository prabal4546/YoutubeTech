//
//  VideoTableViewCell.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 29/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    //MARK:- IBOUTLETS
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCelll(_ v: Video){
        
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else{
            return
        }
        //set the title
        titleLabel.text = video?.title
        
        //set the date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //MARK:- set the Thumbnail
        
        //check if thumbnail is present
        guard video!.thumbnail != "" else{
            return
        }
        
        //CHECK CACHE BEFORE DOWNLOADING DATA
        if let cachedData = CacheManager.getVideoCache(video!.thumbnail){
            
            //set the thumbnail ImageView
            thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        //IF CACHE DATA IS NIL THEN DO THE BELOW STEPS
        
        
        //create url object
        let url = URL(string: video!.thumbnail)
        
        //shared url session with url
        let session = URLSession.shared
        
        //create a data task
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil || data != nil{
                
                //Save the data in cache
                CacheManager.setCache(url!.absoluteString, data)
                
                //check the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail{
                    
                    //video cell has been recycled for another video and no longer matches the same thumbnail that was downloaded
                    return
                }
                
                //create the image object
                let image = UIImage(data: data!)
                
                //set the image data
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        task.resume()
        
        
    }

}
