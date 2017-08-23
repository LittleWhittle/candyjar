import Foundation

struct RandomColor {
    var text = "Hello, RandomColor"
    
    let availableColors = ["Green", "Orange", "Yellow", "Purple", "Pink", "Blue", "Red", "White", "Black", "Brown"]
    
    
    public func pickupRandomColor() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(availableColors.count)))
        return availableColors[randomIndex]
    }
    
}
