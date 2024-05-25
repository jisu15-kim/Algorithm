import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    var sValueArray = Array(s).compactMap { Int($0.asciiValue!) - 97 }
    let skipValue = Array(skip).compactMap { Int($0.asciiValue!) - 97 }
    let skipIndex = index
    let unmutableSValueArray = sValueArray
    unmutableSValueArray.enumerated().forEach { index, value in
        var offset = 0
        
        // index 횟수만큼 foreach
        (0 ..< skipIndex).forEach { _ in
            
            while true {
                offset += 1
                var convertedValue = value + offset
                if convertedValue > 25 {
                    convertedValue = convertedValue % 26
                }
                if skipValue.firstIndex(of: convertedValue) == nil {
                    break
                }
            }
        }
        sValueArray[index] = value + offset
    }
    print(sValueArray)
    let resultArr = sValueArray.map {
        var ascciValue = $0
        if ascciValue > 25 {
            ascciValue = ascciValue % 26
        }
        return String(UnicodeScalar(ascciValue + 97)!)
    }.joined()
    return resultArr
}

solution("aukks", "wbqd", 5)
