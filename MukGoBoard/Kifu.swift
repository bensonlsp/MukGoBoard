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

class Kifu {
    var map: [Point]
    
    init() {
        self.map = []
        var y = 19
        var x = 1
        for _ in 1...19 {
            for _ in 1...19 {
                self.map.append(Point(x: x, y: y, order: 0, mark: .Empty))
                x = x + 1
            }
            y = y - 1
            x = 1
        }
    }
    
    func updateMark(x x: Int, y: Int, mark: Mark) {
        for count in 0..<map.count {
            if (x == map[count].x && y == map[count].y) {
                map[count].mark = mark
            }
        }
    }
    
    func printKifu() {
        var count = 0
        var boardTXT: String = ""
        for _ in 1...19 {
            for _ in 1...19 {
                switch map[count].mark {
                    case .Black: boardTXT = boardTXT + "X "
                    case .White: boardTXT = boardTXT + "O "
                    case .Empty: boardTXT = boardTXT + "- "
                }
                count = count + 1
            }
            boardTXT = boardTXT + "\n"
        }
        print(boardTXT)
    }
}