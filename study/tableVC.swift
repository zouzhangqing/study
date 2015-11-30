

import UIKit


class tableVC: UITableViewController{
    

    @IBOutlet var tableview: UITableView!
    var refresh = UIRefreshControl()   //  ========== 1=============
    var str:[String]=["ccc","sss"]
    
    //懒加载
    lazy var dataList:[String] = {
        var dataArray = [String]()
        for i in 1..<5{
            dataArray.append("-----"+"\(i)")
        }
        return dataArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  ========== 2=============
    
        refresh.addTarget(self, action: "onPullToFresh", forControlEvents: UIControlEvents.ValueChanged)
        refresh.attributedTitle = NSAttributedString(string:"Loading...")
        tableview.addSubview(refresh)
    }
    //  ========== 3=============
    func onPullToFresh(){
        str = ["ccc","sss","eee","fff","fffffff","eeeeeee","ttttt","yyyyy","uuuuu","kkkkk","lllll","llllll"]
       self.tableview.reloadData()
       refresh.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//表格数据源和类分离
extension tableVC {
    // 每组有多少行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return str.count
    }
    
    
    // 每行展示什么内容
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //        let cells = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")! as UITableViewCell
        //        cells.textLabel?.text = dataList[indexPath.row]
        //        return cells
        let item = str[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "");
        
        cell.textLabel!.text = item
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        return cell;
        
        
    }

}
