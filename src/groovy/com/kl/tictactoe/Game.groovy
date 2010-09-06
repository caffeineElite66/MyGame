package com.kl.tictactoe

import java.util.Map;

/**
 * The Game object is use for controlling the information
 * exchanged between two players in the game.
 * 
 * The reason why I did not represent the board with a simple
 * map is because I want extendibility. If I want to use different
 * strategies for the AI to play this game such as minMax. I can extend 
 * the BaseNode class to have a goodness value.
 */
class Game {
    Map board
    Player turn
    Player winner
    Player humanPlayer
    Player computerPlayer
	String level
	String status = "PROGRESS"
	
    def winningMetrix = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
	
    Game(turn, humanPlayer, computerPlayer, level) {
        this.board = [
			1:new BaseNode(new Player(0)), 
			2:new BaseNode(new Player(0)),  
			3:new BaseNode(new Player(0)),  
			4:new BaseNode(new Player(0)),  
			5:new BaseNode(new Player(0)),  
			6:new BaseNode(new Player(0)),  
			7:new BaseNode(new Player(0)),  
			8:new BaseNode(new Player(0)),  
			9:new BaseNode(new Player(0))
		]
        this.turn = turn
        this.winner = new Player(0, "", "NOBODY")
        this.humanPlayer = humanPlayer
        this.computerPlayer = computerPlayer
		this.level = level
    }

    public boolean haveWinner() {
        for (metrix in this.winningMetrix) {
			def sum = 0
            for (pos in metrix) {
                sum = sum + this.board[pos].player.value
            }
            if (sum == 9) {
				this.winner = this.humanPlayer
				this.status = 'WIN'
				return true
            }
            if (sum == 24) {
				this.winner = this.computerPlayer
				this.status = 'WIN'
				return true
			}
        }
        return false
    }
	
	public boolean haveTie() {
		for (node in this.board) {
			if (node.value.player.value == 0) {
				return false
			}
		}
		this.status = 'TIE'
		return true
	}
}
