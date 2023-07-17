//
//  NetworkError.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

enum NetworkError: Error {
    case wrongUrl, serverError, decodingError, unknown
    
    var customMessage: String {
        return "Une erreur est survenu"
    }
}
