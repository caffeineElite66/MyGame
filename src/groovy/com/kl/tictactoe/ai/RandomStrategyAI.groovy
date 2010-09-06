package com.kl.tictactoe.ai

import com.kl.tictactoe.Player;

class RandomStrategyAI extends BaseAI {
	
	public RandomStrategyAI(Player computerPlayer, Player humanPlayer) {
		this.computerPlayer = computerPlayer
		this.humanPlayer = humanPlayer
	}
	
	public int getNextMove(Map board){
		this.board = board
		return randomNextMove()
	}
	
	private int randomNextMove(){
		def possibleMoves = []
		for (pos in 1..9){
			if (this.board[pos].player.value == 0) {
				possibleMoves.add(pos)
			}
		}
		if (possibleMoves.size() > 0){
			def random = new Random()
			def move = random.nextInt(possibleMoves.size())
			return possibleMoves[move]
		} else {
			return 0;
		}
	}
}
