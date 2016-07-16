import Foundation

let splitter = ";"

// Two variations at move 3
let sgf1 = "(;FF[4]GM[1]SZ[19];B[aa];W[bb](;B[cc]N[Var A];W[dd];B[ad];W[bd])(;B[hh]N[Var B];W[hg])(;B[gg]N[Var C];W[gh];B[hh];W[hg];B[kk]))"

// Two variations at different moves
let sgf2 = "(;FF[4]GM[1]SZ[19];B[aa];W[bb](;B[cc];W[dd](;B[ad];W[bd])(;B[ee];W[ff]))(;B[hh];W[hg]))"


let nodes1 = sgf1.componentsSeparatedByString(splitter)

for node in nodes1 {
    print(node)
}

let nodes2 = sgf2.componentsSeparatedByString(splitter)

for node in nodes2 {
    print(node)
}

enum StoneColor {
    case Black
    case White
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

class SGFNode {
    let move: Move
    let nodeID: String
    var children: [SGFNode]
    var parent: SGFNode?
    
    init(move: Move) {
        self.move = move
        
        var color: String = ""
        if self.move.stoneColor == .Black {
            color = "B"
        } else if self.move.stoneColor == .White {
            color = "W"
        }
        
        self.nodeID = "\(color)\(move.x)x\(move.y)"
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

/*
if (end of node = "]") {
    add node
    parents node = previous node
} else if (end of node = "(") {
    
    count of ")"
    
    if (number ")" = 0) {
        set variation node = this node
        add node
        parents node = previous node
        variationCount +1
    } if (number ")" > 0) {
        variationCount - number ")"
        set variation = this node
        add node
        parents node = variation node
        variationCount +1
    }
    
} else if (end of node = ")") {
    End
}

variationPoint = nodeNumber

/*
 (
 FF[4]GM[1]SZ[19]
 B[aa]
 W[bb](
 B[cc]N[Var A]
 W[dd]
 B[ad]
 W[bd])(
 B[hh]N[Var B]
 W[hg])(
 B[gg]N[Var C]
 W[gh]
 B[hh]
 W[hg]
 B[kk]))
 */
 */
