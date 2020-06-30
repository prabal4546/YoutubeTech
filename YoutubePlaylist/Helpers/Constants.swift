//
//  Constants.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 27/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUBJycsmduvYEL83R_U4JriQ"
    static var BASE_URL =   "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"

    static var VIDEOCELL_ID = "VideoCell"
    
    static var EMBED_URL = "https://www.youtube.com/embed/"

    
}
