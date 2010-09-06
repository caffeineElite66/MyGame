package com.kl.tictactoe.ai


import java.util.Map;
import com.kl.tictactoe.Player;

/**
 * The corner strategy is an algorithm I learn from keep losing in 
 * tic-tac-toe. This algorithm is as follow:
 * 1. block your opponent's winning move if exist.
 * 2. take your winning move if exist.
 * 3. take a corner that has nothing around them if possible.
 * 4. take a edge if possible.
 * This algorithm will only result in a tie or win.
 * 
 *  Of course there are some tweaks within the algorithm base 
 *  on who will take the first move. More detail explanation 
 *  will be with each method.
 * 
 * 
 * @author caffeineElite
 *
 */
class CornerStrategyAI extends BaseAI {
	// the winningMetrix is a list of
	// all possible rows.
	def winningMetrix = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	Player goFirst
	
	/**
	 * Custom constructor 
	 * 
	 * @param computerPlayer
	 * @param humanPlayer
	 * @param goFirst
	 */
	public CornerStrategyAI(Player computerPlayer, Player humanPlayer, Player goFirst){
		this.computerPlayer = computerPlayer
		this.humanPlayer = humanPlayer
		this.goFirst = goFirst
	}
	
	/**
	 * The implement of the abstract class.
	 * We will deploy our algorithm here.
	 * 
	 * see in-line comment.
	 */
	public int getNextMove(Map board){
		this.board = board
		
		/**
		 * if human go first, we'll first:
		 * 1. take take the middle.
		 * 2. check for winning move for AI
		 * 3. check winning move for human
		 * 4. if meddle is not available meaning 
		 *    human already took middle as the first move.
		 *    we'll take the corner. Otherwise take the edge.
		 *    
		 *  if computer go first:
		 *  1. check winning move for AI
		 *  2. check winning mvoe for human
		 *  3. take a corner.
		 *  4. take a edge.
		 */
		if (goFirst.type == 'HUMAN'){
			if ((move = takeMiddle()) != 0) return move
			if ((move = winningMove(computerPlayer)) != 0) return move
			if ((move = winningMove(humanPlayer)) != 0) return move
			def sum = 0
			for (pos in 1..9){
				if (this.board[pos].player.value != 0) {
					sum = sum + 1
				}
			}
			if (sum == 1) {
				if ((move = takeCorner()) != 0) return move
			} else {
				if ((move = takeEdge()) != 0) return move
			}
		} else {
			if ((move = winningMove(computerPlayer)) != 0) return move
			if ((move = winningMove(humanPlayer)) != 0) return move
			if ((move = takeCorner()) != 0) return move
			if ((move = takeEdge()) != 0) return move
		}
		return 0;
	}
	
	/**
	 * check the winningMextrix and add up the values
	 * in each row. if the end result is 6 in human case,
	 * 16 in computer case. we'll take that empty slot.
	 * 
	 * @param player
	 * @return
	 */
	private int winningMove(Player player) {
		for (metrix in winningMetrix) {
			int sum = 0 , move = 0
			for (pos in metrix) {
				def node = this.board[pos]
				sum = sum + node.player.value
				if (this.board[pos].player.value == 0) move = pos
			}
			if ((player.type == 'HUMAN') && (sum == 6)) 
				return move
			if ((player.type == 'COMPUTER') && (sum == 16)) 
				return move
		}
		return 0;
	}
	
	/**
	 * take a corner, but we have to take a corner that 
	 * is optimal which is a corner that has nothing around
	 * them. To archive this, we'll go through the winningMextrix
	 * and add up the values. If there is one odd number in there
	 * and the sum is add up to 8 (meaning there is only one of AI's 
	 * own piece in there). We'll take that corner. If not we'll take 
	 * any corner.
	 * 
	 * @return
	 */
	private int takeCorner() {
		for (metrix in winningMetrix) {
			def sum = 0, move = 0
			def qualify = false
			for (pos in metrix) {
				sum = sum + this.board[pos].player.value
				move = pos
				if (pos % 2 == 0) qualify = true
			}
			if (sum == 8 && qualify == true) return move
		}
		
		def corners = [1, 3, 7, 9]
		for (pos in corners) {
			if (this.board[pos].player.value == 0) return pos
		}
		return 0;
	}
	
	/**
	 * Just pick a edge that is aviable.
	 * @return
	 */
	private int takeEdge() {
		def edges = [2, 6, 8, 4]
		for (pos in edges) {
			if (this.board[pos].player.value == 0) return pos
		}
		return 0;
	}
	
	/**
	 * Take the middle which is pos 5.
	 * @return
	 */
	private int takeMiddle() {
		if (this.board[5].player.value == 0) return 5;
		return 0;
	}
}
