//
//  Extensions.swift
//  GameOfChats
//
//  Created by Weijie Lin on 6/7/17.
//  Copyright © 2017 Weijie Lin. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        
        self.image = nil
        
        // check cache for image first
        
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) {
            self.image = cachedImage
            return
        }
        
        // Otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = UIImage(data: data!)
                }
                
            })
            
        }).resume()
    }
    
}
