import Foundation

func main() {
    do {
        try Day1().main()
        try Day2().main()
    } catch {
        fatalError("Failed with error \(error)")
    }
}

main()
