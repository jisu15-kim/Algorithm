//
//  Queue.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/19.
//

import Foundation

struct ProcessQueue {
    var datas = [ProcessQueueElement]()
    
    mutating func enqueue(value: Int, priority: Int) {
        var hasPriority = false
        for (index, data) in datas.enumerated() {
            // 같은 우선순위 task가 있다면 그곳에 배열로 넣기
            if data.priority == priority {
                datas[index].insertValue(value)
                hasPriority = true
                break
            }
        }
        
        if !hasPriority {
            datas.append(ProcessQueueElement(value: [value], priority: priority))
        }
        
        datas.sort { $0.priority > $1.priority }
    }
    
    mutating func checkFirstPriorityAndDequeue(value: Int) -> Bool {
        if !datas.isEmpty {
            var isRemoved = false
            
            for (index, element) in datas[0].value.enumerated() {
                if value == element {
                    // 일치함
                    datas[0].value.remove(at: index)
                    isRemoved = true
                    // 데이터가 0개면 아예 지우기
                    if datas[0].value.isEmpty {
                        self.datas.remove(at: 0)
                    }
                }
            }
            return isRemoved
        }
        return false
    }
}

struct ProcessQueueElement {
    var value = [Int]()
    let priority: Int
    
    mutating func insertValue(_ insertValue: Int) {
        value.append(insertValue)
    }
    
    mutating func removeValue(_ indexToRemove: Int) {
        value.remove(at: indexToRemove)
    }
}

func processQueueSolution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = ProcessQueue()
    
    priorities.enumerated().forEach { index, priority in
        queue.enqueue(value: index, priority: priority)
    }
    
    var count = 0
    var processCount = 0
    while !queue.datas.isEmpty {
        var element = count % priorities.count
        var isProcessed = queue.checkFirstPriorityAndDequeue(value: element)
        if isProcessed {
            processCount += 1
        }
        
        if location == element && isProcessed {
            break
        }
        
        count += 1
    }
    
    return processCount
}
