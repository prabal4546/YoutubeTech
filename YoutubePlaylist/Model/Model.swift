//
//  Model.swift
//  YoutubePlaylist
//
//  Created by PRABALJIT WALIA     on 27/06/20.
//  Copyright © 2020 PRABALJIT WALIA    . All rights reserved.
//

import Foundation
import UIKit

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
}

class Model{
    
    var delegate:ModelDelegate?
    
    //MARK:-
    func getVideos(){
        
        if let url = URL(string: Constants.BASE_URL){
            //1.URL SESSION
            let session = URLSession.shared
            //2. DATA TASK WITH SESSION WE HAVE CREATED
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil || data == nil{
                    print(error)
                    //                    let alert = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                    //                    let action = UIAlertAction(title: "OK", style: .cancel, handler:nil )
                    //                    alert.addAction(action)
                    
                    return
                }
                do{
                    
               let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                    let response = try decoder.decode(Response.self, from: data!)
                    
                    if response.items != nil{
                        
                        DispatchQueue.main.async {
                            self.delegate?.videosFetched(response.items)

                        }
                        
                        
                    }
                    dump(response)
                    print(response)
                    
                }catch{
                    
                }
            }
            task.resume()
            
        }
    }
}
