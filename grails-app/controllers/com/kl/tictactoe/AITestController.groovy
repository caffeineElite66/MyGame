package com.kl.tictactoe

/**
 * This is a quick prototype of my level 'HARD'
 * algorithm. It's not part of the game, but if you 
 * wish to see it you can access it via 
 * ../AITest/index
 */
class AITestController {
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

	def clear = {
		session.board = null
		session.turn = null
		redirect(action:"index")
	}
    def index = {
        if (session.board == null) {
            def board = [ "1":0, "2":0, "3":0, "4":0, "5":0, "6":0, "7":0, "8":0, "9":0]
            session.board = board
        }
        if (session.turn == null) {
            session.turn = 'pc'
        }
        def message = ''
        if (session.turn == 'human'){
            if (checkWinner("x")) return [message:"X won!!!"]
            if (checkWinner("o")) return [message: "O won!!!"]
            def move = params.position
            if (move != null) {
                def board = session.board
                if (board[move] == 0) {
                    session.board[move] = 3
                    session.turn = 'pc'
                } else {
                    message = message + " move taken."
                }
            } else {
                message = message + "please make a move."
            }
        } else {
            if (checkWinner("x")) return [message:"X won!!!"]
            if (checkWinner("o")) return [message: "O won!!!"]
            def move = getAIMove()
            if (move == "0") return [message : "error"]
            session.board[move.toString()] = 8
            session.turn = 'human'
            message = "pc done"
        }
        return [message: message]
    }

    private getAIMove() {
        def move = "0"
        if ((move = winNext("o")) != "0") {
			return move
        }
        if ((move = winNext("x")) != "0") {
			return move
        }
        if ((move = takeCorner("o")) != "0") {
			return move
        }
        if ((move = takeEdge("o")) != "0") {
			return move
        }
        return move
    }

    private winNext(player) {
        def winNext = 0
        def sum = 0
        def move = 0
		def nextMove = 0
        if (player == "x") winNext = 6
        if (player == "o") winNext = 16
        this.winningMetrix.each {
            it.each {
                sum = sum + session.board[Integer.toString(it.value)]
                if (session.board[Integer.toString(it.value)] == 0) move = it.value
            }
            if (sum == winNext) {
				nextMove = move
			}
            sum = 0
        }
        return Integer.toString(nextMove)
    }
    private takeCorner(player) {
		for (i in this.winningMetrix) {
			def sum = 0
			def move = 0
			def qualify = false
			for (pos in i) {
				sum = sum + session.board[Integer.toString(pos)]
				move = Integer.toString(pos)
				if (pos % 2 == 0) qualify = true
			}
			if (sum == 8 && qualify == true) return move
		}
        def corners = [1,3,7,9]
		def move = "0"
		for (i in corners) {
			if (session.board[Integer.toString(i)] == 0) return Integer.toString(i)
		}
        return "0"
    }
    private takeEdge(player) {
        def edges = [2,6,8,4]
		for (i in edges) {
			if (session.board[Integer.toString(i)] == 0) return Integer.toString(i)
		}
        return "0"
    }

    private checkWinner(player) {
        def winTotal = 0
		def isWon = false
        if (player == 'x') winTotal = 9
        if (player == 'o') winTotal = 24
        def sum = 0
        this.winningMetrix.each {
			def temp = it
            it.each {
				def temp1 = session.board[Integer.toString(it.value)]
				def temp2 = sum 
                sum = temp2 + temp1
            }
            def total = winTotal
			def endResult = sum 
			if (total == endResult){
				isWon = true
			}
            sum = 0
        }
        return isWon
    }
}
