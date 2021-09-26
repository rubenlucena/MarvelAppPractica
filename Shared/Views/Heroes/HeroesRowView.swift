//
//  HeroesRowView.swift
//  PracticaMarvelApp (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Result
    
    @StateObject private var viewModel = PhotoViewModel()
    
    var body: some View {
        VStack{
            if let photo = viewModel.photo {
                photo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.9)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            }
        }
        .onAppear{
            viewModel.loadImage(url: hero.thumbnail.path)
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: HeroesViewModel().getHero())
    }
}
