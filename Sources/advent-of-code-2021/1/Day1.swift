//
//  Day1.swift
//  
//
//  Created by Diego Costantino on 12/1/21.
//

import Foundation

struct Day1: Day {
    func puzzle1() throws {
        let input = try inputFile(named: "input1") { Int($0)! }
        
        let count = input[1...].reduce((input[0], 0)) { acc, el in
            let (prev, total) = acc
            return (el, el > prev ? total + 1 : total)
        }.1
        print(count)
    }
    

    func puzzle2() throws {
        let input = try inputFile(named: "input1") { Int($0)! }
        var prev = Int.max
        var count = 0
        for (i, n) in input[0..<input.count - 2].enumerated() {
            let partial = n + input[i + 1] + input[i + 2]
            if partial > prev {
                count += 1
            }
            prev = partial
        }
        print(count)
    }
    
    func main() throws {
        try puzzle1()
        try puzzle2()
    }
}
