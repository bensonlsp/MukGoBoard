//
//  GameRecord.swift
//  MukGoBoard
//
//  Created by Benson Lo on 9/7/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import Foundation


class Tree {
    var tree: [Node]
    var currentId: Int
    
    init() {
        self.tree = []
        currentId = 0
    }
}

class Node {
    var id: Int
    let data: Any
    let parentId: Int?
    
    // Init for root node
    init(id: Int, data: Any) {
        self.id = id
        self.data = data
        self.parentId = nil
    }
}

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