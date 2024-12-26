//
//  main.swift
//  단어변환
//
//  Created by 김지수 on 12/23/24.
//

import Foundation

struct Queue<T> {
    var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visitedArr = Array<Bool>(repeating: false, count: words.count)
    let resultWord = target
    var count = 0
    var queue = Queue<String>()
    
    queue.enqueue(begin)
    
    while true {
        count += 1
        var tempWordArray = [String]()
        queue.elements.forEach { _ in
            if let word = queue.dequeue() {
                tempWordArray.append(word)
            }
        }
        
        for word in tempWordArray {
            for (index, targetWord) in words.enumerated() {
                if visitedArr[index] { continue }
                let isMatched = bfs(word: word, target: targetWord, arrayIndex: index)
                if isMatched { return count }
            }
        }
        
        if queue.elements.isEmpty {
            break
        }
    }
    
    func bfs(word: String, target: String, arrayIndex: Int) -> Bool {
        var matchCount = 0
        
        for (index, char) in word.enumerated() {
            let index = word.index(word.startIndex, offsetBy: index)
            if char == target[index] {
                matchCount += 1
            }
        }
        
        if matchCount == word.count - 1 {
            print("word: \(word), target: \(target)")
            if target == resultWord { return true }
            visitedArr[arrayIndex] = true
            queue.enqueue(target)
        }
        return false
    }
    
    return 0
}

print(solution(
    "hit",
    "cog",
    ["hot", "dot", "dog", "lot", "log", "cog"]
))

print(solution(
    "hit",
    "cog",
    ["hot", "dot", "dog", "lot", "log"]
))
