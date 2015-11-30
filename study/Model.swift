
import Foundation

class Model {
    private var age:Int = 0
    private var name:String?
    
    func setAge(age:Int){
        self.age = age
    }
    func getAge()->Int{
        return age
    }
    
}