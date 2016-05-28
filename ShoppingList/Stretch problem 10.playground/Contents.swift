//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Handshape {
    case rock
    case paper
    case scissors
    
}

enum MatchResult {
    case win
    case lose
    case draw
}

func match(handShape1: Handshape, handshape2: Handshape ) -> MatchResult {
    switch (handShape1, handshape2) {
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
        return .win
    case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
        return .draw
    default:
        return .lose
    }
    }

match(.rock, handshape2: .paper)