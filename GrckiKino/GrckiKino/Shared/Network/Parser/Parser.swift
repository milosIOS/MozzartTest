//
//  Parser.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation

private protocol Parsable {
    func decodeData<T : Codable>(type: T.Type,data : Data) throws -> T
    func decodeArrayData<T : Codable>(type: T.Type,data : Data) throws -> [T]
}

class Parser : Parsable{
    static let shared = Parser()
    
    func decodeData<T : Codable>(type: T.Type,data : Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            let decodeData = try decoder.decode(T.self, from: data)
            return decodeData
        }catch {
            throw RemoteResourceError.invalidJson
        }
    }
    func decodeArrayData<T : Codable>(type: T.Type,data : Data) throws -> [T] {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeData = try decoder.decode([T].self, from: data)
            return decodeData
        }catch {
            throw RemoteResourceError.invalidJson
        }
    }
}
