//
//  NetworkService.swift
//  Navigation
//
//  Created by Fedor Boriskin on 20.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration: String, CaseIterable{
    case one = "https://swapi.dev/api/people/8"
    case two = "https://swapi.dev/api/starships/3"
    case three = "https://swapi.dev/api/planets/5"
}


struct NetworkService {
    
    public typealias ObjectEndpointCompletion<Object: Decodable> = (Result<Object, Error>, HTTPURLResponse?) -> ()
    
    
    func startURLSessionDataTask(caseMy: AppConfiguration) {

        let myUrl = caseMy
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URL(string: myUrl.rawValue)!) { (data, response, error) in
            if let response = response {
                print("RESPONSE")
                print(response)
            }
                               
            guard let data = data else { return }
            print("DATA")
            print(data)
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("\n AllHeaderFields - \(httpResponse.allHeaderFields)")
                print("\n StatusCode - \(httpResponse.statusCode)")
            }
            
        }.resume()
    }
    
}
