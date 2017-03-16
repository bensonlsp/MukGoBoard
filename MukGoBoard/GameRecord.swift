//
//  GameRecord.swift
//  MukGoBoard
//
//  Created by Benson Lo on 9/7/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import Foundation

class Move {
    let stoneColor: StoneColor?
    let x: Int
    let y: Int
    
    init(stoneColor: StoneColor?, x: Int, y: Int) {
        self.stoneColor = stoneColor
        self.x = x
        self.y = y
    }
}

class SGFNode {
    let move: Move
    let nodeID: String
    var children: [SGFNode]
    var parent: SGFNode?
    
    init(move: Move) {
        self.move = move
        
        var color: String = ""
        if self.move.stoneColor == .black {
            color = "B"
        } else if self.move.stoneColor == .white {
            color = "W"
        }
    
        self.nodeID = "\(color)\(move.x)x\(move.y)"
        self.children = []
        self.parent = nil
    }
    
    func addChildNode(_ node: SGFNode) {
        self.children.append(node)
        node.parent = self
    }
    
    func findMove(x: Int, y: Int) -> SGFNode? {
        if (move.x == x && move.y == y) {
            return self
        }
        for child in children {
            if let found = child.findMove(x: x, y: y) {
                return found
            }
        }
        return nil
    }
}

class Record {
    var sequence: [SGFNode]
    var currentNode: SGFNode
    
    init() {
        self.sequence = []
        let rootNode = SGFNode(move: Move(stoneColor: nil, x: -1, y: -1))
        self.sequence.append(rootNode)
        currentNode = rootNode
    }
    
    func resetRecord() {
        sequence.removeAll()
        let rootNode = SGFNode(move: Move(stoneColor: nil, x: -1, y: -1))
        self.sequence.append(rootNode)
        currentNode = rootNode
    }
    
    func addMove(_ move: Move) {
        let newNode = SGFNode(move: move)
        sequence.append(newNode)
        currentNode.addChildNode(newNode)
        currentNode = newNode
    }
    
    func backAMove() -> Move? {
        if currentNode.parent != nil {
            let oldCurrentNode = currentNode
            currentNode = currentNode.parent!
            return oldCurrentNode.move
        } else {
            return nil
        }
    }
    
    func printSequence() {
        for node in sequence {
            print("[\(node.nodeID)]:")
            if node.children.count > 0 {
                for child in node.children {
                    print("    Node Id [\(node.nodeID)] has a child: \(child.nodeID) ")
                }
            }
        }
    }
}
