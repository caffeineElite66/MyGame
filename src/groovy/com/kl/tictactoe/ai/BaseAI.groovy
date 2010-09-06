package com.kl.tictactoe.ai
import com.kl.tictactoe.Player

/**
 * Base class for AI
 * 
 */
abstract class BaseAI {
	int move
	Player computerPlayer
	Player humanPlayer
	Map board 
	
	/**
	 * This is the only class a subclass of this base class
	 * need to implement. This method should have many
	 * other support class.
	 * 
	 * @param board
	 * @return
	 */
	abstract int getNextMove(Map board)
}

	
