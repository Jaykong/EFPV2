//
//  RecentSessionCell.swift
//  EFPV2
//
//  Created by JayKong on 2018/1/31.
//  Copyright © 2018 JayKong. All rights reserved.
//

import BadgeSwift
import UIKit
class RecentSessionCell: UITableViewCell {
    @IBOutlet var date: UILabel!
    @IBOutlet var badge: BadgeSwift!
    @IBOutlet var paName: UILabel!

    @IBOutlet var groupName: UILabel!

    @IBOutlet var avatarView: AvatarView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.layer.masksToBounds = true
        avatarView.backgroundColor = UIColor.gray
        avatarView.image = UIImage(named: "145852")
    }

    func configure(withViewModel viewModel: RecentSessionRepresentable) {
        date.text = viewModel.date
        badge.text = "\(viewModel.unreadMessage)"
        paName.text = viewModel.paName
        groupName.text = viewModel.courseName
    }
    
    override func prepareForReuse() {
        
    }
}
