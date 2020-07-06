//
//  NetworkErrors.swift
//  events-app
//
//  Created by Bruno Rocha on 05/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case noIneternetConnection
    case connectionCancelled
    case resourceNotFound
    case responseDecoding
    case unauthorized
    case serverError
    case unknown

    var localizedDescription: String {
        switch self {
        case .noIneternetConnection, .connectionCancelled:
            return "Dispositivo sem acesso à internet."
        case .resourceNotFound:
            return "Desculpe, mas o recurso requisitado não existe."
        case .responseDecoding:
            return "Desculpe, mas houve um erro na leit."
        case .unauthorized:
            return "Por favor verifique a sua conexão à internet."
        case .serverError:
            return "Por favor verifique a sua conexão à internet."
        case .unknown:
            return "Descuplpe, mas ocorreu um problema desconhecido."
        }
    }
}
