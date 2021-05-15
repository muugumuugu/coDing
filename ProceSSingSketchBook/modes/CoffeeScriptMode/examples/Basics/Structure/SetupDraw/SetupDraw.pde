###
Setup and Draw. 

The code inside the draw() function runs continuously
from top to bottom until the program is stopped.    
###

# The statements in the setup() function 
# execute once when the program begins
setup: ->
    
    size 640, 360    # Size must be the first statement
    stroke 255       # Set line drawing color to white
    frameRate 30
    
    @y = 100


# The statements in draw() are executed until the 
# program is stopped. Each statement is executed in 
# sequence and after the last line is read, the first 
# line is executed again.
draw: ->
    
    background 0     # Set the background to black
    @y = @y - 1 
    @y = height if @y < 0
    
    line 0, @y, width, @y    
 

