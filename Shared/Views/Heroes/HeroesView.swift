//
//  HeroesView.swift
//  PracticaMarvelApp (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel : HeroesViewModel
    
    var body: some View {
        NavigationView{
            List{
                if let data = viewModel.heroes?.data.results{
                    ForEach(data){ hero in
                        NavigationLink(
                            destination: SeriesListView(),
                            label: {
                                HeroesRowView(hero: hero)
                            })
                    }

                }
            }
            .navigationBarTitle("Heroes")
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: HeroesViewModel())
    }
}
