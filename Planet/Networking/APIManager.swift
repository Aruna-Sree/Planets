//  APIManager.swift
//  Planet
//
//  Created by Aruna Yarra on 04/01/19.
//  Copyright © 2019 Aruna Yarra. All rights reserved.
//


import UIKit

/// Class that handles all the API Requests
class APIManager {
    
    func getDataWith(urlString: String, completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return completion(.Error("Invalid URL"))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return completion(.Error(error!.localizedDescription))
            }
            guard let data = data else {
                return completion(.Error(error?.localizedDescription ?? "No data to show"))
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return completion(.Error(error?.localizedDescription ?? "No data to show"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }
}

enum Result<T> {
    case Success(T)
    case Error(String)
}
