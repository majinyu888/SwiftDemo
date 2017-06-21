//
//  StatusTableViewCell.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/21.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    
    // MARK: - 公共属性
    
    public var model:StatusTableViewModel = StatusTableViewModel() {
        didSet {
            self.contentLabel.text = model.content
        }
    }
    
    // MARK: - 连线
    
    @IBOutlet weak private var headImageView: UIImageView!
    @IBOutlet weak private var uName: UILabel!
    @IBOutlet weak private var levelImageView: UIImageView!
    @IBOutlet weak private var contentLabel: UILabel!
    
    
    
    // MARK: - System Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Custom Methods
    
    
    
}
