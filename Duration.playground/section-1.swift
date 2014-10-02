// Playground - noun: a place where people can play

import UIKit

struct Duration {
    let nanos: Int64

    init(_ nanos: Int64) {
        self.nanos = nanos
    }
}

extension Duration {
    static let Day = Duration(1_000_000_000 * 3600 * 24)
    static let Hour = Duration(1_000_000_000 * 3600)
    static let Minute = Duration(1_000_000_000 * 60)
    static let Second = Duration(1_000_000_000)
}

extension Duration {
    func hours() -> Double {
        return Double(self.nanos) / (1_000_000_000 * 60 * 60)
    }

    func minutes() -> Double {
        return Double(self.nanos) / (1_000_000_000 * 60)
    }

    func seconds() -> Double {
        return Double(self.nanos) / 1_000_000_000
    }

    func nanoseconds() -> Int64 {
        return self.nanos
    }

    func microseconds() -> Double {
        return Double(self.nanos) / 1_000
    }

    func milliseconds() -> Double {
        return Double(self.nanos) / 1_000_000
    }
}

func + (left: Duration, right: Duration) -> Duration {
    return Duration(left.nanos + right.nanos)
}

func - (left: Duration, right: Duration) -> Duration {
    return Duration(left.nanos - right.nanos)
}

func / (left: Duration, right: Int) -> Duration {
    return Duration(left.nanos / Int64(right))
}

func / (left: Duration, right: Duration) -> Double {
    return Double(left.nanos) / Double(right.nanos)
}

func * (left: Int, right: Duration) -> Duration {
    return Duration(Int64(left) * right.nanos)
}

func * (left: Double, right: Duration) -> Duration {
    return Duration(Int64(left * Double(right.nanos)))
}

let d = Duration(1_000_000_000 * 2 * 3600)
d.hours()
d.minutes()
d.seconds()


let d2 = Duration.Hour + Duration.Hour + Duration.Minute
let d3 = 8 * Duration.Hour

(Duration.Hour - Duration.Minute).seconds()

1.5 * Duration.Hour

(1.5 * Duration.Hour).seconds()



Duration.Day / Duration.Hour
