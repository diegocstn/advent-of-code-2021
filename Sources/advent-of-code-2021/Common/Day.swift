//
//  File.swift
//  
//
//  Created by Diego Costantino on 12/1/21.
//

import Foundation

protocol Day {
    func main() throws
}

extension Day {
    func inputFile(named name: String,
                   withExtension ext: String = "txt") throws -> [Int] {
        guard let url = Bundle.module.url(forResource: name, withExtension: ext) else {
            fatalError("Input file not found")
        }
        let input = try String(contentsOfFile: url.path)
            .split(separator: "\n")
            .map { Int($0)! }
        
        return input
    }
}
