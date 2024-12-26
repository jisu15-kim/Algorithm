//
//  main.swift
//  여행경로
//
//  Created by 김지수 on 12/23/24.
//

import Foundation

var ans = [String]()

func dfs(_ tickets:[[String]], _ visited: [Bool], _ begin: String, _ route: [String]) {
    if tickets.count + 1 == route.count {
        ans = ans == [] ? route : ans
        return
    }
    
    var route = route
    var visited = visited
    
    for i in 0..<tickets.count {
        if !visited[i] && begin == tickets[i][0]{
            visited[i] = true
            route.append(tickets[i][1])
            dfs(tickets, visited, tickets[i][1], route)
            visited[i] = false
            route.removeLast()
        }
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    let visited = Array(repeating: false, count: tickets.count)
    let tickets = tickets.sorted{ $0[1] < $1[1] }
    dfs(tickets, visited, "ICN", ["ICN"])
    
    return ans
}


//print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
//print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
print(solution([["ICN", "AAA"], ["ICN", "BBB"], ["ICN", "CCC"], ["CCC", "ICN"], ["BBB", "ICN"]]))

["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
