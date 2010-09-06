package com.kl.tictactoe

import com.kl.tictactoe.ai.RandomStrategyAI;
import com.kl.tictactoe.ai.CornerStrategyAI;

/**
 * This controller is responsible for setting up
 * the game by instantiating all the objects.
 * 
 *  It'll controll the flow of moves and information create
 *  by each of the two player.
 *  
 * @author caffeineElite
 *
 */
class GameController {
	
	/**
	 * no index page, redirect to option.
	 */
	def index = { 
		redirect(action:options)
	}
	
	/**
	 * Options page will take in all the 
	 * 'HUMAN' selected values.
	 */
	def options = { 
		session.invalidate()
	}
	
	/**
	 * This is where we start the game. Options page
	 * will submit everything to here. 
	 */
	def start = { 
		def playerSelected = params.get("player")
		def turn = params.get("turn")
		def level = params.get("level")
		def humanPlayer, computerPlayer, goNext
		// create players
		if (playerSelected == "X") {
			humanPlayer = new Player(3, "X", "HUMAN")
			computerPlayer = new Player(8, "O", "COMPUTER")
		} else {
			humanPlayer = new Player(3, "O", "HUMAN")
			computerPlayer = new Player(8, "X", "COMPUTER")
		}
		
		// set turn
		if (turn == "HUMAN") { 
			goNext = humanPlayer
		} else { 
			goNext = computerPlayer
		}
		
		// set level to the correct AI strategy
		if (level == 'EASY') { 
			session.ai = new RandomStrategyAI(computerPlayer, humanPlayer)
		} else if (level == 'HARD') {
			session.ai = new CornerStrategyAI(computerPlayer, humanPlayer, goNext)
		}
		
		// create game
		session.game = new Game(goNext, humanPlayer, computerPlayer, level)
		
		// everything is initualized, push to the player
		if (goNext.type == 'COMPUTER') {
			redirect(action:'computerMove')
		} else {
			redirect(action:'humanMove')
		}
	}
	
	/**
	 * Process page is where we display all the board
	 * after each player made a move.
	 */
	def process = {
		if (!session.game.haveWinner() && !session.game.haveTie()){
			if (session.game.turn.type == 'COMPUTER') 
				redirect(action:'computerMove')
		}
		def map = [
			"turn" 	: session.game.turn.piece,
			"human" : session.game.humanPlayer.piece,
			"pc"	: session.game.computerPlayer.piece,
			"level" : session.game.level,
			"winner": session.game.winner.piece,
			"board" : session.game.board
		]
		[ game : map ]
	}
	
	/**
	 * This controller method will make mark the board
	 * for the submited human move.
	 */
	def humanMove = {
		// if it's first move
		def move = params.get("move")
		if (move != null) {
			session.game.board[Integer.parseInt(move)].player = session.game.humanPlayer
			session.game.turn = session.game.computerPlayer
		}
		redirect(action:'process')
	}
	
	/**
	 * This will prompt the in session AI to get the next move
	 * and mark the board.
	 */
	def computerMove = {
		if (session.game.turn.type == 'COMPUTER') {
			def computerPlayerMove = session.ai.getNextMove(session.game.board)
			def node = session.game.board[computerPlayerMove]
			node.player = session.game.computerPlayer
			session.game.turn = session.game.humanPlayer
		}
		redirect(action:'process')
	}
}