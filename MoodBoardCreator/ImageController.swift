//
//  ImageController.swift
//  MoodBoardCreator
//
//  Created by Curt McCune on 6/7/22.
//

import Foundation

class ImageController {
    
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    static let baseURL = "https://api.unsplash.com/search/photos"
    
    static func fetchTopLevel(color: String?, orientation: String?, query: String, completion: @escaping (Result<TopLevelObject, NetworkingError>) -> Void) {
        
        //URL
        guard let baseURL = URL(string: self.baseURL) else {return completion(.failure(.badBaseURL))}
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        var queries:[URLQueryItem] = []
        
        let queryTerm = URLQueryItem(name: "query", value: query)
        queries.append(queryTerm)
        
        if let color = color, color != "" {
            let colorQuery = URLQueryItem(name: "color", value: color)
            queries.append(colorQuery)
        }
        
        if let orientation = orientation, orientation != "" {
            let orientationQuery = URLQueryItem(name: "orientation", value: orientation)
            queries.append(orientationQuery)
        }
        
        guard let apiKey = apiKey else { return completion(.failure(.apiKeyError))}
        let apiKeyQuery = URLQueryItem(name: "client_id", value: apiKey)
        queries.append(apiKeyQuery)
        
        components?.queryItems = queries
        
        guard let builtURL = components?.url else {return completion(.failure(.badBuiltURL))}
        
        print(builtURL)
        
        //Talk to server
        URLSession.shared.dataTask(with: builtURL) { data, response, error in
            //Handle Errors
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
                completion(.failure(.invalidResponse))
                return
            }
            
            if error != nil {
                return completion(.failure(.errorWithRequest))
            }
            
            //Check for Data
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
           
            
            //Decode data
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                return completion(.success(topLevelObject))
            } catch {
                return completion(.failure(.couldNotDecode))
            }
        }.resume()
        
    }
        
        
        
        
        
        
    
    
    
    
}