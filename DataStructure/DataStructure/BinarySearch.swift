//
//  BinarySearch.swift
//  DataStructure
//
//  Created by Jisu Kim on 2023/11/05.
//

import Foundation

class BinarySearchTree {
    var head: Node
    
    init(head: Node) {
        self.head = head
    }
    
    func insert(value: Int) {
        var currentNode = self.head
        while true {
            if currentNode.value <= value {
                // 오른쪽 데이터가 있다면
                if let right = currentNode.right {
                    currentNode = right
                } else {
                    currentNode.right = Node(value: value)
                    break
                }
            } else {
                if let left = currentNode.left {
                    currentNode = left
                } else {
                    currentNode.left = Node(value: value)
                    break
                }
            }
        }
    }
    
    func isValueExist(value: Int) -> Bool {
        var currentNode: Node? = self.head

        while currentNode != nil {
            if currentNode!.value == value {
                return true
            }
            
            if value < currentNode!.value {
                currentNode = currentNode!.left
            } else {
                currentNode = currentNode!.right
            }
        }
        return false
    }
    
    func removeValue(value: Int) {
        /// 삭제할 노드의 오른쪽 자식 선택
        /// 오른쪽 자식의 가장 왼쪽에 있는 노드를 선택
        /// 해당 노드를 삭제할 노드의 parent 노드의 왼쪽 branch가 가리키게 함
        /// 해당 노드의 왼쪽 branch가 삭제 할 노드의 왼쪽 child 노드를 가리키게 함
        /// 해당 노드의 오른쪽 branch가 삭제할 node의 오른쪽 child 노드를 가리키게 함
        /// 해당 노드가 오른쪽 child node를 가지고 있었을 경우에는 해당 노드의 본래 parent ?
        
        var checked = false
        var parentNode: Node = self.head
        var currentNode: Node? = self.head

        while currentNode != nil {
            if currentNode!.value == value {
                checked = true
                break
            }
            
            if value < currentNode!.value {
                parentNode = currentNode!
                currentNode = currentNode!.left
            } else {
                parentNode = currentNode!
                currentNode = currentNode!.right
            }
        }
        
        guard checked,
              let currentNode else { return }
        
        // leaf 노드인 경우
        if currentNode.left == nil && currentNode.right == nil {
            if currentNode.value < parentNode.value {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
        }
        
        // 하나의 child만 있는 경우
        // 1. left만 존재
        if currentNode.left != nil && currentNode.right == nil {
            if currentNode.value < parentNode.value {
                parentNode.left = currentNode.left
            } else {
                parentNode.right = currentNode.left
            }
        }
        
        // 2. right만 존재
        if currentNode.right != nil && currentNode.left == nil {
            if currentNode.value < parentNode.value {
                parentNode.left = currentNode.right
            } else {
                parentNode.right = currentNode.right
            }
        }
        
        // 두개의 child가 모두 있는 경우
        // 🚀 두둥
        if currentNode.left != nil && currentNode.right != nil {
            
            var changeNodeParent = currentNode
            var changeNode: Node? = currentNode.right
            
            while changeNode?.left != nil {
                changeNodeParent = changeNode!
                changeNode = changeNode?.left
            }
            
            if changeNode?.right != nil {
                changeNodeParent.left = changeNode?.right
            }
            
            if currentNode.value < parentNode.value {
                parentNode.left = changeNode
            } else {
                parentNode.right = changeNode
            }
        }
    }
}

class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}


