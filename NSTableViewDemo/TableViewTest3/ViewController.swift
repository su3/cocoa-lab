//
//  ViewController.swift
//  TableViewTest3
//
//  Created by Su Xiaozhou on 25/04/2017.
//  Copyright © 2017 Su Xiaozhou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var dataSource: [DataModel]?
    
    @IBOutlet weak var tableView: NSTableView!{
        didSet{
            let nib = NSNib(nibNamed: "CustomCell", bundle: nil)
            self.tableView.register(nib, forIdentifier: "CustomCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = DataSource.dataArray()
        self.tableView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(notification:)), name: NSNotification.Name.NSWindowDidResize, object: nil)
    }
    
    func receivedNotification(notification: Notification){
        //Take Action on Notification
        self.tableView.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
}

//MARK: - NSTableViewDataSource

extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        guard let dataSource = dataSource else {
            return 0
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let rowView = tableView.rowView(atRow: row, makeIfNecessary: false)
        rowView?.isEmphasized = false
        let cell = tableView.make(withIdentifier: "CustomCell", owner: self) as! CustomCell
        let item = dataSource?[row]
        cell.setContent(item: item)
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let cell = tableView.make(withIdentifier: "CustomCell", owner: self) as! CustomCell
        let item = dataSource?[row]
        cell.setContent(item: item)
        
        let tc = tableView.tableColumns[0]
        
        let gap: CGFloat = 70 + 9 + 18 + 13 //label 以外的宽度
        cell.titleLabel.preferredMaxLayoutWidth = tc.width - gap
        cell.detailLabel.preferredMaxLayoutWidth = tc.width - gap
    
        return cell.fittingSize.height
    }
 
}

//MARK: - NSTableViewDelegate

extension ViewController: NSTableViewDelegate{
    
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
//        print("click at row \(row)")
        return true
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let itemsSelected = tableView.selectedRowIndexes.count
        if itemsSelected > 0 {
            let row = tableView.selectedRow
            tableView.deselectRow(row)
        }
    }
    
}

