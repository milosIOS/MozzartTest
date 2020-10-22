//
//  ParserHelper.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation

final class ParserHelper {
    static let threader: Threader = {
            return Threader()
    }()
    
    static func parse<T: Decodable>(data: Data, completion : @escaping (Result<[T], ErrorResult>) -> Void){
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let models = try jsonDecoder.decode([T].self, from: data)
            threader.mainThread {
                completion(.success(models))
            }
        } catch {
            threader.mainThread {
                completion(.failure(.parser(string: "Error while parsing json array data \(T.self)")))
            }
       }
    }
    static func parse<T : Decodable>(data: Data, completion : @escaping (Result<T, ErrorResult>) -> Void) {
        
            let jsonDecoder = JSONDecoder()
            do {
                let model = try jsonDecoder.decode(T.self, from: data)
                threader.mainThread {
                    completion(.success(model))
                }
            } catch {
                threader.mainThread {
                    completion(.failure(.parser(string: "Error while parsing json data \(T.self)")))
                }
            }
    }
}

