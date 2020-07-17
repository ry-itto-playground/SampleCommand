import ArgumentParser

struct SampleSubCommands: ParsableCommand {
    static var configuration: CommandConfiguration = .init(
        subcommands: [Sum.self, Average.self],
        defaultSubcommand: Sum.self
    )
}

struct Sum: ParsableCommand {
    @Argument()
    var numbers: [Int] = []

    mutating func run() throws {
        print(numbers.reduce(0, +))
    }
}

struct Average: ParsableCommand {
    @Argument()
    var numbers: [Int] = []

    func validate() throws {
        if numbers.count == 0 {
            throw ValidationError("Please specify numbers.")
        }
    }

    mutating func run() throws {
        print(numbers.reduce(0, +) / numbers.count)
    }
}

SampleSubCommands.main()
