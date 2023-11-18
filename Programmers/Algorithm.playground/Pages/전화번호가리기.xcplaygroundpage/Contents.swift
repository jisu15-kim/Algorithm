//: [Previous](@previous)

import Foundation

func solution(_ phone_number:String) -> String {
    let front = String(phone_number.prefix(phone_number.count - 4))
    return phone_number.replacingOccurrences(of: front, with: String(repeating: "*", count: front.count))
}

solution("01033334444")
solution("027778888")
