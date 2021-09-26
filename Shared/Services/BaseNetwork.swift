//
//  BaseNetwork.swift
//  PracticaMarvelApp (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import Foundation

let server = "https://gateway.marvel.com"
let apiKey = "9cc53fc4a6602e5982ebcec6f1a91123"
let ts = "1"
let hash = "b2d2f41d0fc13cdf426ca77a1d419a3e"

enum endpoints : String {
    case characters = "/v1/public/characters"
}

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let content = "application/json"
}

struct BaseNetwork {
    private func getUrl(endpoint: String, subPath:String="") -> String{
        
        return "\(server)\(endpoint)\(subPath)?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)"
        
    }
    
    func getSessionMarvelCharacters() -> URLRequest{
        let urlCad : String = getUrl(endpoint: endpoints.characters.rawValue)
        
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content/type")
        
        return request
    }
    
    func getSessionMarvelSeries(idHero: Int) -> URLRequest {
        var urlCad : String = getUrl(endpoint: endpoints.characters.rawValue, subPath: "/\(idHero)/series")
        urlCad += "orderBy=-modified"
        
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content/type")
        
        return request
    }
}
