//
//  NetworkAPI.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/6/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import Foundation

class NetworkAPI {
    
    let apiKey = "\(SecretKey())"
    let baseURL = "https://newsapi.org/v2/"
    let urlSession = URLSession.shared
    
    public static let shared = NetworkAPI()
    
    
    enum networkCalls {
        case articles
        case category(category: String)
        case sources
        case everything(q: String)
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getPath() -> String {
             switch self {
             case .category, .articles:
                 return "top-headlines"
             case .sources:
                return "sources"
             case .everything:
                return "everything"
             }
         }
         
         func getHeaders(secretKey: String) -> [String: String] {
             return [
                 "Accept": "application/json",
                 "Content-Type": "application/json",
                 "Authorization": "X-Api-Key \(SecretKey())",
                 "Host": "newsapi.org"
             ]
         }
         
         func catchParameters() -> [String: String] {
             switch self {
             case .articles:
                 return [
                     "country": "us",
                 ]
                 
             case .category(let category):
                 return [
                     "country": "us",
                     "category": category
                 ]
             case .sources:
                return ["language": "en"]
                
             case .everything(let qInput):
                return ["q": qInput]
            }
         }
        
        func parametersToString() -> String {
            let parameterArray = catchParameters().map { key, value in
                return "\(key)=\(value)"
            }
            return parameterArray.joined(separator: "&")
        }
    }
    
    enum Result<call> {
         case success(call)
         case failure(Error)
     }
     
     enum networkError: Error {
         case couldNotParse
         case noData
     }
    
    private func newsRequest(for networkCall: networkCalls) -> URLRequest {
        // grab the parameters from the endpoint and convert them into a string
        let stringParams = networkCall.parametersToString()
        // get the path of the endpoint
        let path = networkCall.getPath()
        // create the full url from the above variables
        let fullURL = URL(string: baseURL.appending("\(path)?\(stringParams)"))!
        print(fullURL)
        // build the request
        var request = URLRequest(url: fullURL)
        request.httpMethod = networkCall.getHTTPMethod()
        request.allHTTPHeaderFields = networkCall.getHeaders(secretKey: "apiKey")
        print("\(String(describing: request.allHTTPHeaderFields))")
        return request
    }
    
    func getArticles(category: String, _ completion: @escaping (Result<[Article]>) -> Void) {
        let articlesRequest = newsRequest(for: .category(category: category))
        
        let task = urlSession.dataTask(with: articlesRequest) { data, response, error in
            // Check for errors.
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(networkError.noData))
            }
            
            do{
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                print(jsonObject)
            } catch {
                print(error.localizedDescription)
            }
            guard let result = try? JSONDecoder().decode(ArticleList.self, from: data) else {
                
                return completion(Result.failure(networkError.couldNotParse))
            }
            
            let articles = result.articles
            
            // Return the result with the completion handler.
            DispatchQueue.main.async {
                completion(Result.success(articles))
            }
        }
        
        task.resume()
    }
    
}
