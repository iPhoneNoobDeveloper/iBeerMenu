//
//  BeerServiceRouter.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import Foundation

class BeerServiceRouter {
    
    lazy var urlPath: URL = {
        let urlPath = URL(string:"\(ConfigUrl.API_BASE_URL)")
        return urlPath!
    }()
    

    func getBeerList(currentPage: Int, completion:@escaping ([Beer]?, Int, String?) -> ()) {
        let urlPath = URL(string:"\(ConfigUrl.API_BASE_URL)\(currentPage)")
        print(urlPath as Any)
        let dataTask = URLSession.shared.dataTask(with: urlPath!) { (data, response, error) in
            if (error != nil) {
                completion(nil, 0, error?.localizedDescription)
            } else {
                
                guard let jsonData = data else {
                    completion(nil, 0, error?.localizedDescription)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    
                    if (httpResponse.statusCode == 200) {
                        
                        do {
                            let decoder = JSONDecoder()
                            let beers = try decoder.decode([Beer].self, from: jsonData)
                            
                            if !beers.isEmpty {
                                completion(beers, (httpResponse.statusCode), nil)
                            } else {
                                completion(nil, (httpResponse.statusCode), "")
                            }
                        } catch {
                            completion(nil, (httpResponse.statusCode), "Invalid response")
                        }
                        
                    } else {
                        completion(nil, (httpResponse.statusCode), error?.localizedDescription)
                    }
                }
            }
        }
        dataTask.resume()

    }
}

