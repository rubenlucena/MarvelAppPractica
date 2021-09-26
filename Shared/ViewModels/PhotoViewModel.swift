//
//  PhotoViewModel.swift
//  MarvelAppPractica (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import Combine
import SwiftUI

class PhotoViewModel : ObservableObject {
    @Published var photo:Image?

    var suscriptor = Set<AnyCancellable>()

    func loadImage(url:String){
        let urlDownload = URL(string: url)!
        
        
        URLSession.shared
            .dataTaskPublisher(for: urlDownload)
            .map{
                UIImage(data: $0.data)
            }
            .map{ image -> Image in
                if let imagen = image {
                    return Image(uiImage: imagen)
                }
                else {
                    return Image(systemName: "person.fill")
                }
            }
            .replaceError(with: Image(systemName: "person.fill"))
            .replaceEmpty(with: Image(systemName: "person.fill"))
            .receive(on: DispatchQueue.main)
            .sink{
                self.photo = $0
            }
            .store(in: &suscriptor)
    }

}
