//
//  board.swift
//  MukGoBoard
//
//  Created by Benson Lo on 1/7/2016.
//  Copyright © 2016年 imukmuk. All rights reserved.
//

import Foundation

enum Mark {
    case Black
    case White
    case Empty
}

struct Point {
    var x: Int
    var y: Int
    var order: Int
    var mark: Mark
}

class Board {
    var map: [Point]
    
    init() {
        var count = 0
        self.map = []
        for x in 1...19 {
            for y in 1...19 {
                self.map.append(Point(x: x, y: y, order: 0, mark: .Empty))
                count = count + 1
            }
        }
    }
    
    func updateMark(x: Int, y: Int, mark: Mark) {
        for count in 0..<map.count {
            if (x == map[count].x && y == map[count].y) {
                map[count].mark = mark
            }
        }
    }
}