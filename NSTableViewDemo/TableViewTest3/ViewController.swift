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
        print("view for \(row)")
//        cell.needsLayout = true
//        cell.layoutSubtreeIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let cell = tableView.make(withIdentifier: "CustomCell", owner: self) as! CustomCell
        let item = dataSource?[row]
        cell.setContent(item: item)
        cell.needsLayout = true
        cell.layoutSubtreeIfNeeded()
//        return cell.contentView.fittingSize.height
        return cell.fittingSize.height
        
        
    }
    
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        print("will display \(row)")
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

