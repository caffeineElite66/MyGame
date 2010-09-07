class BootStrap {

	def exceptionHandler 
	
    def init = { servletContext ->
		exceptionHandler.exceptionMappings = [
			'java.lang.Exception': '/error'	
		]
    }
    def destroy = {
    }
}
