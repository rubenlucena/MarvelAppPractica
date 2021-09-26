//
//  StatusModel.swift
//  MarvelAppPractica (iOS)
//
//  Created by Ruben Lucena on 26/9/21.
//

import Foundation

enum Status {
    case none, loading, loaded, register, error(error:String)
}
