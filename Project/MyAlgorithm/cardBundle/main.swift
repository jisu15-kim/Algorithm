//
//  main.swift
//  cardBundle
//
//  Created by 김지수 on 12/11/24.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var card1Index = 0
    var card2Index = 0
    
    for card in goal {
        var isMatched = false
        if card1Index != cards1.count,
           cards1[card1Index] == card {
            isMatched = true
            card1Index += 1
        }
        
        if card2Index < cards2.count,
           cards2[card2Index] == card {
            isMatched = true
            card2Index += 1
        }
        
        if !isMatched {
            return "No"
        }
    }
    
    return "Yes"
}


print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
print(solution(["i", "water", "drink"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
