/*:
 # Mario
 
 Add your Mario solution (however far you got) to the space below.
 
 Then, commit your work.
 
 Finally, push your work to the remote origin for your repository on GitHub.com.
 
 We will go through this together.
 */

// Add your code below
func levelCost(heights: [Int], maxJump: Int) -> Int{

var previousheight = 0

var energy = 0



for i in heights{
    
    var jumpheight = previousheight - i
    
    if previousheight == 0 {
        
        previousheight = i
    }
    
else {
    
    
    
    if jumpheight < 0 {
        jumpheight = -jumpheight
    }
    
    if jumpheight > maxJump {
        return -1
    }
    
    if jumpheight == 0 {
        energy += 1
    } else {
        energy += 2 * jumpheight
    }
    
    previousheight = i
}
}

return energy
}






