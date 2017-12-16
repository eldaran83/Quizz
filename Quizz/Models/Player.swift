//
//  Player.swift
//  Quizz
//
//  Created by lionel montoya on 16/12/2017.
//  Copyright © 2017 lionel montoya. All rights reserved.
//

import Foundation

var namePlayer: String = "Player "
var scorePlayer = 0
var statePlayerGame: StatePlayer = .ongoing

enum StatePlayer {
    case ongoing, over
}
