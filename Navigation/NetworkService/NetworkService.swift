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
    
    static let shared = NetworkService()
        
    func startURLSessionDataTask(caseMy: AppConfiguration) {

        let myUrl = caseMy
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URL(string: myUrl.rawValue)!) { (data, response, error) in
            if let response = response {
                print("RESPONSE")
                print(response)
            }
                               
            guard let data = data else { return }
            let stringData = String(decoding: data, as: UTF8.self)
            print("DATA")
            print(stringData)
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("\n AllHeaderFields - \(httpResponse.allHeaderFields)")
                print("\n StatusCode - \(httpResponse.statusCode)")
            }
            
        }.resume()
    }
    
    func startURLSessionDataTaskWithcJSON(competion: @escaping (Human) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/13") else { return }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

                    guard let userId = json["userId"] as? Int else { return }
                    guard let id = json["id"] as? Int else { return }
                    guard let title = json["title"] as? String else { return }
                    guard let completed = json["completed"] as? Bool else { return }
                    
                    let human = Human(userId: userId, id: id, title: title, completed: completed)
                    competion(human)
                }
            
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func startURLSessionDataTaskWithcCodable(completion: @escaping (Planet) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else { return }
        let decoder = JSONDecoder()
       
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            if let post = try? decoder.decode(Planet.self, from: data) {

                completion(post)
            } 
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getNamesOfPeopleDecodable(comlete: @escaping ([String]) -> Void) {
        
        NetworkService.shared.startURLSessionDataTaskWithcCodable { planet in
            var arrayName: [String] = []
    
                for i in planet.residents {
                    ololo(urlMy: i) { string in
                    arrayName.append(string)
                        comlete(arrayName)
                    }
                }
            
                func ololo(urlMy: String, completion: @escaping (String) -> Void) {
                    let decoder = JSONDecoder()
                    let urlSession = URLSession.shared
                guard let urlMy = URL(string: urlMy) else { return }
                urlSession.dataTask(with: urlMy) { data, response, error in
                
                guard let data = data else { return }
                if let post = try? decoder.decode(Names.self, from: data) {
                    completion(post.name)
                }
            
                if let error = error {
                    print(error.localizedDescription)
                }
            }.resume()
                }
            }
        }
    }

