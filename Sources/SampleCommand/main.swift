import ArgumentParser

struct SampleCommand: ParsableCommand {
    @Argument()
    var context: String

    @Flag()
    var upper: Bool = false

    @Option(
        name: .shortAndLong,
        help: "Repeating context"
    )
    var repeatTimes: Int?

    mutating func run() throws {
        if upper {
            self.context = context.uppercased()
        }

        if let repeatTimes = repeatTimes {
            self.context = String(repeating: context, count: repeatTimes)
        }
        print(context)
    }
}

SampleCommand.main()
