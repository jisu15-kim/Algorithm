//
//  main.swift
//  이모티콘할인행사
//
//  Created by 김지수 on 12/26/24.
//

import Foundation

struct User {
    let rateLimit: Int
    let priceLimit: Int
    var hasMembership: Bool = false
    var paidPrice: Int = 0
    
    mutating func processEvent(
        discountArray: [Int],
        emojiPrices: [Int]
    ) {
        if self.hasMembership {
            return
        }

        var totalPrices: Int = 0
        
        for (index, price) in emojiPrices.enumerated() {
            let discount = discountArray[index]
            if discount < self.rateLimit {
                continue
            }
            let rate = Float(discount) / 100
            let price = Int(Float(price) * (1.0 - rate))
            totalPrices += price
        }
        
        self.paidPrice += totalPrices
        
        if self.paidPrice >= self.priceLimit {
            self.paidPrice = 0
            self.hasMembership = true
        }
    }
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    let discountPercentage = [10, 20, 30, 40]
    
    var discountConditions = [[Int]]()
    
    func dfs(current: [Int]) {
        if current.count == emoticons.count {
            discountConditions.append(current)
            return
        }
        
        for discount in discountPercentage {
            var newArray = current
            newArray.append(discount)
            dfs(current: newArray)
        }
    }

    dfs(current: [])
    
    var totalPrices: Int = 0
    var totalMembership: Int = 0
    var maximumDiscountValue = [Int]()
    
    discountConditions.forEach { discountArray in
        var users = users.map { User(rateLimit: $0[0], priceLimit: $0[1]) }
        users.enumerated().forEach { index, user in
            users[index].processEvent(discountArray: discountArray, emojiPrices: emoticons)
        }
        let currentTotalPrices = users.reduce(0) { $0 + $1.paidPrice }
        let currentTotalMembership = users.reduce(0) { $0 + ($1.hasMembership ? 1 : 0) }
                
        if totalMembership < currentTotalMembership {
            maximumDiscountValue = discountArray
            totalMembership = currentTotalMembership
            totalPrices = currentTotalPrices
        }
        
        if totalMembership == currentTotalMembership {
            if totalPrices < currentTotalPrices {
                maximumDiscountValue = discountArray
                totalPrices = currentTotalPrices
            }
        }
    }

    return [totalMembership, totalPrices]
}


print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
//print(solution([[25, 10000]], [7000, 9000]))
print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
