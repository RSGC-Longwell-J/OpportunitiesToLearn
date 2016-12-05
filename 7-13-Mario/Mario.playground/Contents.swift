/*:
 # Mario
 
 Add your Mario solution (however far you got) to the space below.
 
 Then, commit your work.
 
 Finally, push your work to the remote origin for your repository on GitHub.com.
 
 We will go through this together.
 */

// Add your code below
func levelCost(heights: [Int], maxJump: Int) -> Int

var previousheight = 0

var energy = 0



for i in heights{
    var jumpheight = previousheight - i
    
    if previousheight == 0 {
        
        previousheight = i
    }
    
} else {
    
    
    
    if jumpheight < 0{
        jumpheight = -jumpheight
    }
    
    if jumpHeight > maxJump {
        return -1
    }
    
    if jumpHeight == 0 {
        totalEnergy += 1
    } else {
        Energy += 2 * jumpHeight
    }
    
    previousheight = i
}
}

return totalEnergy
}






