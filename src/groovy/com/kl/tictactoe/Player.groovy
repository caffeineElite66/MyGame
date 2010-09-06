package com.kl.tictactoe

/**
 * This class define the player object.
 * 
 * The only intresting thing here is the 'value'
 * variable. If the the player is human, the value 
 * will be 3, and if it's computer, it'll 8.
 * 
 * The reason for this is that it give me a way
 * to calculate if a player is winning a match or 
 * if the player already won. It also allow me to apply 
 * more logic base on the added up values. 
 * 
 * for example: if a human player is about to win the 
 * match, the added up value for that metrix would be 6. 
 * for the computer, it would be 16. I picked 3 and 8 because
 * 8 will always added up to a even number and 3 will be odd. 
 * I know it'll be 12 if you add 4 times but we'll never do that
 * with a 3x3 board. the various sums of 3 and 8 will never be the
 * same within the 3x3 board. 
 */
class Player {
	int value
	String piece
	String type
	
	public Player(int value, String piece, String type){
		this.value = value
		this.piece = piece
		this.type = type
	}
	
	public Player(int value){
		this.value = value
		this.piece = ""
		this.type = "NOBODY"
	}
}
