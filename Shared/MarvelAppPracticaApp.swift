//
//  MarvelAppPracticaApp.swift
//  Shared
//
//  Created by Ruben Lucena on 26/9/21.
//

import SwiftUI

@main
struct MarvelAppPracticaApp: App {
    
    var body: some Scene {
        WindowGroup {
            HeroesView(viewModel: HeroesViewModel())
        }
    }
}
