//
//  main.swift
//  방문길이
//
//  Created by 김지수 on 12/23/24.
//

import Foundation

struct Moving {
    var previousX: Int
    var previousY: Int
    var nextX: Int
    var nextY: Int
}

func solution(_ dirs:String) -> Int {
    
    var history = [Moving]()
    
    var xPosition: Int = 0
    var yPosition: Int = 0
    
    func move(_ dir: Character) {
        let previousX = xPosition
        let previousY = yPosition
        switch dir {
        case "U": yPosition += 1
        case "D": yPosition -= 1
        case "L": xPosition -= 1
        case "R": xPosition += 1
        default: break
        }
        let nextX = min(max(xPosition, -5), 5)
        let nextY = min(max(yPosition, -5), 5)
        xPosition = nextX
        yPosition = nextY
        
        let moving = Moving(
            previousX: previousX,
            previousY: previousY,
            nextX: nextX,
            nextY: nextY
        )
        
        if previousX == nextX && previousY == nextY {
            return
        }
        
        // history 에 있지 않다면
        var isContained = false
        for move in history {
            // 시작, 끝이 일치할 때
            let isDirectionMatch = move.nextX == moving.nextX && move.nextY == moving.nextY && move.previousX == moving.previousX && move.previousY == moving.previousY
            // 역방향
            let isReverseDirectionMatch = move.previousX == moving.nextX && move.previousY == moving.nextY && move.nextX == moving.previousX && move.nextY == moving.previousY
            
            if isDirectionMatch || isReverseDirectionMatch {
                isContained = true
                break
            }
        }
        if !isContained {
            history.append(moving)
        }
    }
    
    dirs.forEach { char in
        move(char)
    }
    
    return history.count
}

//print(solution("ULURRDLLU"))
//print(solution("LULLLLLLU"))
print(solution("UDDUU"))
