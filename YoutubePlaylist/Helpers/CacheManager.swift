//
//  CacheManager.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 30/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import Foundation
class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setCache(_ url:String, _ data: Data?){
        
        //store the image data and use the url as key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String)-> Data?{
        
        //try to get the data for specified url
        return cache[url]
    }
}
