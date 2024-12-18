//
//  main.swift
//  ParenthesisString
//
//  Created by 김지수 on 12/7/24.
//

//MARK: - 백준 9012

import Foundation

struct Stack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        items.popLast()
    }
}

func solution(_ input: String) {
    
    var stack = Stack<Character>()
    input.forEach {
        if $0 == ")" && stack.items.last == "(" {
            _ = stack.pop()
        } else {
            stack.push($0)
        }
    }
    print(stack.items.count == 0 ? "YES" : "NO")
}

let inputCount = Int(readLine()!)!
var inputs: [String] = []
for _ in 0..<inputCount {
    if let line = readLine() {
        inputs.append(line)
    }
}

inputs.forEach { input in
    solution(input)
}
