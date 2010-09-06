package com.kl.tictactoe

/**
 * The base node will only need to have a 
 * player object for now. If we developed more
 * complex stretgies for this game. We can 
 * always extends this class for more ability. For example
 * if we want to use the minMax strategy, I can extend
 * this class and add a 'goodness' value.
 */
class BaseNode {
	Player player
	
	public BaseNode(player){
		this.player = player	
	}
}
