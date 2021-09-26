//
//  HeroesViewModel.swift
//  PracticaMarvelApp (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import Combine
import Foundation

class HeroesViewModel: ObservableObject {
    @Published var heroes : MarvelModel?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(){
        getHeroes()
    }
    
    func getHeroes(){
        self.status = Status.loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionMarvelCharacters())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                       response.statusCode == 200 else {
                    self.status = Status.error(error: "Error Servidor")
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: MarvelModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                //Control
                switch completion {
                case .failure(let error):
                    self.status = Status.error(error: error.localizedDescription)
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { data in
                self.heroes = data
            }
            .store(in: &suscriptors)
    }
    
    func getHero() -> Result{
        return Result(id: 1009351, title: "", name: "Hulk", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009351")
    }
}

