

import UIKit
import Alamofire

class ViewController: UIViewController,UITextFieldDelegate{
    
    
    //上传用的
    static let boundary = "itheima-upload"
    
    @IBOutlet weak var showview: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var Keyboard: UITextField!
    @IBOutlet weak var labtxt: UILabel!
    var db:FMDatabase?
    var uid:Int = 0
    var uname:String = ""
    var _view:UIView?
    var views:UIView?
    lazy var str:String = {
        let str = "hello"
        return str
    }()
    
    
    
//    func notification(){
//        let notif:UILocalNotification = UILocalNotification()
//        let app:UIApplication = UIApplication.sharedApplication()
//        app.scheduleLocalNotification(notif)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //数据库
        getDb()
        
        //textField 代理
        txtInput.delegate = self
        Keyboard.delegate = self
//        txtInput.resignFirstResponder()
//        Keyboard.resignFirstResponder()
        let urlString = "http://www.baidu.com"
        let image:UIImage = UIImage(named: "test.png")!
        
        // png 的图片无损压缩格式
        let data = UIImagePNGRepresentation(image)
        //key 是保存到服务器的文件名 可以随便写 data是二进制数据的图片
        let dataList = ["image": data!]
        let param = ["uid":"uid"]
        ViewController.uploadImage(urlString, fieldName: "pic", dataList: dataList, parameters: param)
//        let _view:UIView = UIView()
//        _view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
//        _view.backgroundColor = UIColor.redColor()
//        self.view.addSubview(_view)
//        let button:UIButton = UIButton(type: UIButtonType.ContactAdd)
//        button.frame = CGRect(x: 0,y: 0,width: 60,height: 30)
//        button.center = _view.center
//        button.frame.origin.y = 20
//        button.setTitle("hello", forState: UIControlState.Normal)
//        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
//        button.addTarget(self, action: "tests", forControlEvents: UIControlEvents.TouchUpInside)
//        _view.addSubview(button)
    }
//    func tests(){
//        _view?.hidden = true
//        
//        if views == nil{
//            views = UIView()
//            views!.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
//            views!.backgroundColor = UIColor.greenColor()
//            self.view.addSubview(views!)
//            let button:UIButton = UIButton(type: UIButtonType.ContactAdd)
//            button.frame = CGRect(x: 0,y: 0,width: 60,height: 30)
//            button.center = views!.center
//            button.frame.origin.y = 20
//            button.setTitle("hello", forState: UIControlState.Normal)
//            button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//            button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
//            button.addTarget(self, action: "test:", forControlEvents: UIControlEvents.TouchUpInside)
//            
//            views!.addSubview(button)
//        }else{
//            views?.hidden = false
//        }
//        
//    }
    func test(button:UIButton){
        views?.hidden = true
        _view?.hidden = false
        let lab:UILabel = UILabel()
        lab.text = button.currentTitle
        lab.textColor = UIColor.redColor()
        lab.textAlignment = NSTextAlignment.Center
        lab.frame = CGRect(x: 100,y: 100,width: 100,height: 30)
        lab.backgroundColor = UIColor.blackColor()
        lab.alpha = 0
        views?.addSubview(lab)
        UIView.animateWithDuration(1, animations: { () -> Void in
            lab.alpha = 1
            }) { (Bool) -> Void in
               UIView.animateWithDuration(1, animations: { () -> Void in
                lab.alpha = 0
                }, completion: { (Bool) -> Void in
                    lab.removeFromSuperview()
               })
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //图片上传
    class func uploadImage(URLString: String,fieldName:String,dataList:[String: NSData!],parameters:[String: AnyObject]? = nil){
        let request = NSMutableURLRequest(URL: NSURL(string: URLString)!)
        
        //1.设置请示的方法
        request.HTTPMethod = "POST"
        //2.设置 content-type
        let type = "multipart/form-data; boundary=\(boundary)"
        request.setValue(type, forHTTPHeaderField: "Content-Type")
        let data = formData(fieldName, dataList: dataList, parameters: parameters)
        Alamofire.upload(request, data: data).responseJSON { (resp) -> Void in
            if resp.result.isSuccess{
                print(resp.result.value)
            }
        }
//        NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: data) { (responseData, _, _) -> Void in
//
//            let result = NSJSONSerialization.JSONObjectWithData(responseData!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
//            print(result)
//        }
    }
    //生成上传文件数据
    //dataList:[String: NSData]  String为上传文件的文件名  NSData为上传文件的数据
    //fieldName 服务器字段名
    private class func formData(fieldName:String,dataList:[String: NSData!],parameters:[String: AnyObject]? = nil) -> NSData{
        let dataM = NSMutableData()
        
        //1.遍历字典，拼接字符串参数
        if let params = parameters {
            for (k, v) in params{
                var strM = "--\(boundary)\r\n"
                strM += "Content-Disposition: form-data; name=\"\(k)\"\r\n\r\n"
                strM += "\(v)\r\n"
                
                dataM.appendData(strM.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
            }
        }
        //2.遍历文件数据数组
        
        for (k, v) in dataList{
            var strM = "--\(boundary)\r\n"
            strM += "Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(k)\"\r\n"
            strM += "Content-Type: application/octet-stream\r\n\r\n"
            
            dataM.appendData(strM.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
            //追加文件数据
            dataM.appendData(v)
            dataM.appendData("\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
        }
        //3.请求结尾字符串，告诉服务器，上传数据已经结束
        let tail = "--\(boundary)--\r\n"
        dataM.appendData(tail.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
        return dataM
    }
    
    //键盘遮挡问题
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == Keyboard{
            self.view.frame.origin.y -= 300
        }
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == Keyboard{
            self.view.frame.origin.y += 300
        }
    }
    
    
    //showview
    @IBAction func showViewTest(sender: AnyObject) {
////        let image:UIImageView = UIImageView()
//        let lab:UILabel = UILabel()
//        lab.frame = CGRect(x: 0,y: 0,width: 100,height: 30)
//        lab.text = "Hello World"
//        lab.font = UIFont.boldSystemFontOfSize(6)
//        //image.frame = CGRect(x: 0,y: 0,width: 100,height: 100)
//        //image.backgroundColor = UIColor.greenColor()
        
        let view:UIView = UIView()
        view.frame = CGRect(x: 0,y: 0,width: 100,height: 100)
        let button:UIButton = UIButton(type: UIButtonType.ContactAdd)
        button.frame = CGRect(x: 0,y: 0,width: 60,height: 30)
        button.center = view.center
//        let lib:UILabel = UILabel()
//        lib.textAlignment = NSTextAlignment.Center
//        CGRectGetMaxX(view.frame)
        button.frame.origin.y = 5
        button.setTitle("hello", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
        button.addTarget(self, action: "alert", forControlEvents: UIControlEvents.TouchUpInside)
//        button.enabled = false
//        let lab:UILabel = UILabel()
//        lab.text = "hello"
//        button.backgroundColor = UIColor.redColor()
        view.addSubview(button)
        
        let dx:DXPopover = DXPopover()
       
        dx.showAtView(showview, withContentView: view)
        
    }
    
    func alert(){
       self.labtxt.text = "xxxxxcccc"
//        labtxt.numberOfLines = 0   //需要具有足够的高度，不限制行数
        let path = NSBundle.mainBundle().pathForResource("plist", ofType: "plist")
        let array = NSMutableArray(contentsOfFile: path!)
        let arrays = NSArray(contentsOfFile: path!)
    }
    
    //关闭键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //textField限制长度
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == txtInput{
            let str = textField.text! as NSString
            if textField.text!.characters.count >= 5 {
                textField.text = str.substringToIndex(4)
            }
        }
        return true
    }
    
    //test
    @IBAction func btnaction(sender: AnyObject) {
        createUser()
        saveTest()
        findTest()
        labtxt.text = "\(uid)+=====+\(uname)"
        //这里是关闭键盘的操作
        self.view.endEditing(true)
    }

    //创建数据库
    func getDb(){
        let filemgr = NSFileManager.defaultManager()
        let docsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as NSString
        let databasePath = docsDir.stringByAppendingPathComponent("sqlite.db")
        print(databasePath)
        
            db = FMDatabase(path: databasePath)
        
        
    }
    //打开数据库
    func openDb(){
        if !db!.open(){
            print("Error: \(db!.lastErrorMessage())"+"======打开数据库出错")
        }
    }
    func createUser(){
        let sql = " create table if not exists loginStore ( " +
            "   'uid' text(24,0) not null " +
            "  ,'id' text(64,0) not null " +
            "  ,'password' text(64,0) not null " +
            "  ,'loginTime' numeric not null " +
            "  ,'isAuto' integer not null " +
        "  );"
        openDb()
        if !db!.executeStatements(sql){
            print("Error: \(db!.lastErrorMessage())"+"=====创建表出错")
        }
        db?.close()
        
    }
    func saveTest(){
        let sql = "insert into loginStore(uid,id,password,loginTime,isAuto) values (?,?,?,?,?)"
        openDb()
        if !db!.executeUpdate(sql, withArgumentsInArray: ["1","2","3","4",5]){
            print(db?.lastErrorMessage())
        }
//        if !db!.executeStatements(sql){
//            print("Error: \(db!.lastErrorMessage())"+"=====save user 出错")
//        }
        db?.close()
    }
    func findTest(){
        let sql = "select * from loginStore where uid=?"
        openDb()
        let rs = db!.executeQuery(sql, withArgumentsInArray: [1])
        while rs.next(){
            uid = Int((rs.intForColumn("uid")))
           uname =  (rs.stringForColumn("id"))
        }
        db?.close()
    }
}

