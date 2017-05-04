//
//  CustomCell.swift
//  TableViewTest3
//
//  Created by Su Xiaozhou on 25/04/2017.
//  Copyright © 2017 Su Xiaozhou. All rights reserved.
//

import Cocoa

class CustomCell: NSTableCellView {

    @IBOutlet weak var aImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var detailLabel: NSTextField!
    
    override func awakeFromNib() {
        self.canDrawSubviewsIntoLayer = true
        self.wantsLayer = true
    }
    
    func setContent(item: DataModel?){
        
        guard let item = item else {
            return
        }
        
        self.titleLabel.stringValue = item.title
        self.detailLabel.stringValue = item.detail
        self.aImageView.image = NSImage(named: item.imageName)
        
        self.detailLabel.setNeedsDisplay()
        self.detailLabel.displayIfNeeded()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
