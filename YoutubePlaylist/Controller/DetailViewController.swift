//
//  DetailViewController.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 30/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else{
            return
        }
        
        //1.Create an embed URL
        let embedUrlString = Constants.EMBED_URL + video!.videoId
        
        //2.Load it into the webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Set the the title
        titleLabel.text = video?.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set the description
        textView.text = video?.description
    }
    
    //MARK:-Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    
    
    
}

