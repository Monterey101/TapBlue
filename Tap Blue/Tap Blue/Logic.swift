//
//  Logic.swift
//  Tap Blue
//
//  Created by Kristian Kocic on 15/4/2023.
//

import Foundation

var HighScore = 0
var Coins = 0

func FinishGame(_ score: Int) {
    if score > HighScore {
        HighScore = score
    }
}
