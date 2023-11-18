//
//  Heap.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/12.
//

import Foundation

class MaxHeap {
   var heapArray = [Int?]()
   
   init(rootValue: Int? = nil, rootValues: [Int] = []) {
      self.heapArray.append(nil)
      if let rootValue {
         self.heapArray.append(rootValue)
      }
      rootValues.forEach { self.insert(value: $0) }
   }
   
   func insert(value: Int) {
      heapArray.append(value)
      var valueIndex = heapArray.count - 1
      var parentIndex = valueIndex / 2
      
      while isNeedSwapUp(parentIdx: parentIndex, valueIdx: valueIndex) {
         
         let value = heapArray[valueIndex]
         let parent = heapArray[parentIndex]
         // 자리 바꿔주기
         heapArray[parentIndex] = value
         heapArray[valueIndex] = parent
         
         // index 갱신
         valueIndex = parentIndex
         parentIndex = valueIndex / 2
      }
   }
   
   func isNeedSwapUp(parentIdx: Int,
                   valueIdx: Int) -> Bool {
      if parentIdx < 1 {
         return false
      }
      
      if heapArray[valueIdx]! > heapArray[parentIdx]! {
         return true
      } else {
         return false
      }
   }
   
   func pop() -> Int? {
      guard heapArray.count > 1 else { return nil }
      let root = heapArray[1]
      
      // 마지막 요소의 인덱스
      let lastValueIdx = heapArray.count - 1
      let lastValue = heapArray[lastValueIdx]
      
      // root로 올리기
      heapArray.remove(at: lastValueIdx)
      heapArray[1] = lastValue
      
      var valueIndex = 1
      var swapTargetIndex = Int()
      
      while isNeedSwapDown(valueIndex: valueIndex, swapToIndex: { swapToIndex in
         swapTargetIndex = swapToIndex
      }) {
         // Value 생성
         let value = heapArray[valueIndex]
         let target = heapArray[swapTargetIndex]
         
         // 자리 바꿔주기
         heapArray[swapTargetIndex] = value
         heapArray[valueIndex] = target
         
         // valueIndex 갱신
         valueIndex = swapTargetIndex
      }
      
      return root
   }
   
   func isNeedSwapDown(valueIndex: Int, swapToIndex: @escaping (Int) -> Void) -> Bool {
      let leftChildIndex = valueIndex * 2
      let rightChildIndex = leftChildIndex + 1
      
      // child 값들이 존재하는지 여부
      let hasLeftChild = leftChildIndex < heapArray.count
      let hasRightChild = rightChildIndex < heapArray.count
      
      // 1. 왼쪽조차 존재하지 않는다면
      if !hasLeftChild {
         return false
      }
      
      // 2. 왼쪽만 존재
      if hasLeftChild && !hasRightChild {
         swapToIndex(leftChildIndex)
         return heapArray[valueIndex]! < heapArray[leftChildIndex]!
      }
      
      // 3. 양쪽 모두 존재
      if hasLeftChild && hasRightChild {
         let leftValue = heapArray[leftChildIndex]!
         let rightValue = heapArray[rightChildIndex]!
         
         // 3-1. 양쪽 중 왼쪽이 더 클 대
         if leftValue >= rightValue {
            swapToIndex(leftChildIndex)
            return heapArray[valueIndex]! < leftValue
         }
         // 3-1. 양쪽 중 오른쪽이 더 클 대
         if rightValue > leftValue {
            swapToIndex(rightChildIndex)
            return heapArray[valueIndex]! < rightValue
         }
      }
      return false
   }
}


//MARK: - MinHeap
class MinHeap {
   var heapArray = [Int?]()
   
   init(rootValue: Int? = nil, rootValues: [Int] = []) {
      self.heapArray.append(nil)
      if let rootValue {
         self.heapArray.append(rootValue)
      }
      rootValues.forEach { self.insert(value: $0) }
   }
   
   func insert(value: Int) {
      heapArray.append(value)
      var valueIndex = heapArray.count - 1
      var parentIndex = valueIndex / 2
      
      while isNeedSwapUp(parentIdx: parentIndex, valueIdx: valueIndex) {
         
         let value = heapArray[valueIndex]
         let parent = heapArray[parentIndex]
         // 자리 바꿔주기
         heapArray[parentIndex] = value
         heapArray[valueIndex] = parent
         
         // index 갱신
         valueIndex = parentIndex
         parentIndex = valueIndex / 2
      }
   }
   
   func isNeedSwapUp(parentIdx: Int,
                   valueIdx: Int) -> Bool {
      if parentIdx < 1 {
         return false
      }
      
      if heapArray[valueIdx]! < heapArray[parentIdx]! {
         return true
      } else {
         return false
      }
   }
   
   func pop() -> Int? {
      guard heapArray.count > 1 else { return nil }
      let root = heapArray[1]
      
      // 마지막 요소의 인덱스
      let lastValueIdx = heapArray.count - 1
      let lastValue = heapArray[lastValueIdx]
      
      // root로 올리기
      heapArray.remove(at: lastValueIdx)
      if lastValueIdx == 1 {
         return root
      }
      heapArray[1] = lastValue
      
      var valueIndex = 1
      var swapTargetIndex = Int()
      
      while isNeedSwapDown(valueIndex: valueIndex, swapToIndex: { swapToIndex in
         swapTargetIndex = swapToIndex
      }) {
         // Value 생성
         let value = heapArray[valueIndex]
         let target = heapArray[swapTargetIndex]
         
         // 자리 바꿔주기
         heapArray[swapTargetIndex] = value
         heapArray[valueIndex] = target
         
         // valueIndex 갱신
         valueIndex = swapTargetIndex
      }
      
      return root
   }
   
   func isNeedSwapDown(valueIndex: Int, swapToIndex: @escaping (Int) -> Void) -> Bool {
      let leftChildIndex = valueIndex * 2
      let rightChildIndex = leftChildIndex + 1
      
      // child 값들이 존재하는지 여부
      let hasLeftChild = leftChildIndex < heapArray.count - 1
      let hasRightChild = rightChildIndex < heapArray.count - 1
      
      // 1. 왼쪽조차 존재하지 않는다면
      if !hasLeftChild {
         return false
      }
      
      // 2. 왼쪽만 존재
      if hasLeftChild && !hasRightChild {
         swapToIndex(leftChildIndex)
         return heapArray[valueIndex]! > heapArray[leftChildIndex]!
      }
      
      // 3. 양쪽 모두 존재
      if hasLeftChild && hasRightChild {
         let leftValue = heapArray[leftChildIndex]!
         let rightValue = heapArray[rightChildIndex]!
         
         // 3-1. 양쪽 중 왼쪽이 더 작을 대
         if leftValue <= rightValue {
            swapToIndex(leftChildIndex)
            return heapArray[valueIndex]! > leftValue
         }
         // 3-1. 양쪽 중 오른쪽이 더 작을 대
         if rightValue < leftValue {
            swapToIndex(rightChildIndex)
            return heapArray[valueIndex]! > rightValue
         }
      }
      return false
   }
}

