//
//  File.swift
//  
//
//  Created by Diego Costantino on 12/4/21.
//

import Foundation

struct Day2: Day {
    
    enum Command {
        case up(Int)
        case down(Int)
        case forward(Int)
        
        static func from(string: Substring) -> Command {
            let rawCommand = string.split(separator: " ")
            guard let value = Int(rawCommand[1]) else {
                fatalError("Parsing error: received \(string)")
            }
            switch rawCommand[0] {
            case "up":
                return .up(value)
            case "down":
                return .down(value)
            case "forward":
                return .forward(value)
            default:
                fatalError("Parsing error: received \(string)")
            }
        }
    }
    
    func puzzle1() throws {
        let input = try inputFile(named: "input2") { Command.from(string: $0) }
        let (x, y) = input.reduce((0, 0)) { (acc, command) in
            var (x, y) = acc
            switch command {
            case .up(let value):
                y -= value
            case .down(let value):
                y += value
            case .forward(let value):
                x += value
            }
            return (x, y)
        }
        print("Puzzle1: ", x * y)
    }
    
    func puzzle2() throws {
        let input = try inputFile(named: "input2") { Command.from(string: $0) }
        let (x, y, _) = input.reduce((0, 0, 0)) { (acc, command) in
            var (x, y, aim) = acc
            switch command {
            case .up(let value):
                aim -= value
            case .down(let value):
                aim += value
            case .forward(let value):
                x += value
                y += aim * value
            }
            return (x, y, aim)
        }
        print("Puzzle2: ", x * y)
    }
    
    func main() throws {
        try puzzle1()
        try puzzle2()
    }
}
