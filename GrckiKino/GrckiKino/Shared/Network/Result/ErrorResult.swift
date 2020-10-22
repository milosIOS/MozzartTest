//
//  ErrorResult.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
