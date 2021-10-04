//
//  CommonExtension.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func downloadBeerImageFrom(URL: URL, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            DispatchQueue.main.async {
                self.contentMode = contentMode
                if let data = data {
                    self.image = data.image
                }
            }
        }.resume()
    }
    
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
            
        }).resume()
    }
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct FlatColor {
        
        struct Orange {
            static let NeonCarrot = UIColor(netHex: 0xF7C33C)
            static let Sun = UIColor(netHex: 0xD49D00)
        }
       
    }

}

extension Data {
    var image: UIImage? {
        if let image = UIImage(data: self) {
            return image
        } else {
            return nil
        }
    }
}


extension UIViewController {
    
    // MARK: - show animating toast on success
    func displayAlertOnViewController(title: String?, message: String?, actionTitles: [String?], actionStyles: [UIAlertAction.Style], actions: [((UIAlertAction) -> Void)?]) {
        
        // make sure actionTitles, styles and actions array the same count. Pass nil if you don't need any action handler closure.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            if !actions.isEmpty {
                if actions[index] != nil {
                    let action = UIAlertAction(title: title, style: actionStyles[index], handler: actions[index])
                    alert.addAction(action)
                } else {
                    let action = UIAlertAction(title: title, style: actionStyles[index], handler: nil)
                    alert.addAction(action)
                }
            } else {
                let action = UIAlertAction(title: title, style: actionStyles[index], handler: nil)
                alert.addAction(action)
            }
        }
        
        if let validMessage = message, !validMessage.isEmpty {
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

class Item: Hashable {
    
    var image: UIImage!
    let url: URL!
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(image: UIImage, url: URL) {
        self.image = image
        self.url = url
    }

}
