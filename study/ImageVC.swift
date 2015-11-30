import UIKit

class ImageVC:UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func up(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
//        self.image.frame.origin.y -= 20
        self.image.transform = CGAffineTransformTranslate(image.transform, 0, -10)
        UIView.commitAnimations()
    }
    
    @IBAction func down(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
//        self.image.frame.origin.y += 20
        self.image.transform = CGAffineTransformTranslate(image.transform, 0, 10)
        UIView.commitAnimations()
    }
    
    @IBAction func right(sender: AnyObject){
        UIView.beginAnimations(nil, context: nil)
//        self.image.frame.origin.x += 20
        self.image.transform = CGAffineTransformTranslate(image.transform, 10, 0)
        UIView.commitAnimations()
        
    }

    @IBAction func left(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
//        self.image.frame.origin.x -= 20
        self.image.transform = CGAffineTransformTranslate(image.transform, -10, 0)
        UIView.commitAnimations()
    }
    
    @IBAction func fangda(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
//        self.image.bounds.size.height += 20
//        self.image.bounds.size.width += 20
        self.image.transform = CGAffineTransformScale(image.transform, 1.2, 1.2)
        UIView.commitAnimations()
    }
    
    
    @IBAction func suoxiao(sender: AnyObject) {
         UIView.beginAnimations(nil, context: nil)
//        self.image.bounds.size.height -= 20
//        self.image.bounds.size.width -= 20
        self.image.transform = CGAffineTransformScale(image.transform, 0.9, 0.9)
        UIView.commitAnimations()
    }
    @IBAction func leftzhuang(sender: AnyObject) {
     UIView.beginAnimations(nil, context: nil)
       self.image.transform = CGAffineTransformRotate(image.transform, -0.1)
        UIView.commitAnimations()
    }
    @IBAction func rightzhuan(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
        self.image.transform = CGAffineTransformRotate(image.transform, 0.1)
        UIView.commitAnimations()
    }
}
