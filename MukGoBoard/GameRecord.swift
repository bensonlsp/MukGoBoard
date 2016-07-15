//
//  GameRecord.swift
//  MukGoBoard
//
//  Created by Benson Lo on 9/7/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import Foundation

class Move {
    let stoneColor: StoneColor
    let x: Int
    let y: Int
    
    init(stoneColor: StoneColor, x: Int, y: Int) {
        self.stoneColor = stoneColor
        self.x = x
        self.y = y
    }
}

class SGFNode {
    let move: Move
    var children: [SGFNode]
    var parent: SGFNode?
    
    init(move: Move) {
        self.move = move
        self.children = []
        self.parent = nil
    }
    
    func addChildNode(node: SGFNode) {
        self.children.append(node)
        node.parent = self
    }
    
    func findMove(x x: Int, y: Int) -> SGFNode? {
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
    var currentMove: Int
    
    init() {
        self.sequence = []
        self.currentMove = -1
    }
    
    func resetRecord() {
        sequence = []
    }
    
    func addMove(move: Move) {
        sequence.append(SGFNode(move: move))
        currentMove += 1
    }
    
    func backAMove() -> Move? {
        if record.currentMove >= 0 {
            let currentMove = sequence[record.currentMove]
            sequence.removeAtIndex(record.currentMove)
            record.currentMove -= 1
            return currentMove.move
        } else {
            return nil
        }
    }
    
    func printSequence() {
        var output: String = ""
        for node in sequence {
            output += "(\(node.move.x), \(node.move.y), \(node.move.stoneColor)) "
        }
        print(output)
    }
}