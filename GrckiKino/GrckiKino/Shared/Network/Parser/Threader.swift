//
//  Threader.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
class Threader {
    
    func mainThread(_ block:@escaping() -> Void ) {
        DispatchQueue.main.async {
            block()
        }
    }
}
