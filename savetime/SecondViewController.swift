//
//  SecondViewController.swift
//  savetime
//
//  Created by 정혁 on 2018. 5. 16..
//  Copyright © 2018년 정혁. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let elements = ["Sogang University", "station1", "home", "station2","airport1", "station3","station4","station5"]
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return elements.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.sitelabel.text = elements[indexPath.row]
        cell.siteimage.image = UIImage(named: elements[indexPath.row])
        cell.siteimage.layer.cornerRadius = cell.siteimage.frame.height / 2
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
