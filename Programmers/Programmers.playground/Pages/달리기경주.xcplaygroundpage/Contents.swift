import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var playerToRankDict = [String: Int]()
    var rankToPlayerDict = [Int: String]()
    
    players.enumerated().forEach {
        playerToRankDict.updateValue($0, forKey: $1)
        rankToPlayerDict.updateValue($1, forKey: $0)
    }
    
    callings.forEach { calling in
        if let rank = playerToRankDict[calling] {
            let player = rankToPlayerDict[rank]!
            let prePlayer = rankToPlayerDict[rank - 1]!
            
            playerToRankDict[player] = rank - 1
            playerToRankDict[prePlayer] = rank
            
            rankToPlayerDict[rank - 1] = player
            rankToPlayerDict[rank] = prePlayer
        }
    }
    
    let result = rankToPlayerDict.sorted { $0.key < $1.key }.map { $0.value }
    return result
}

solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])
