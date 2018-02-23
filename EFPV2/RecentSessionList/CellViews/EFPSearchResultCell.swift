//
//  EFPSearchResultCell.swift
//
//
//  Created by JayKong on 2018/2/15.
//

import UIKit
import SnapKit
class EFPSearchResultCell: UITableViewCell {

    var avatarImageView = NIMAvatarImageView()
    var customTeamName = UILabel()
    var message = UILabel()
    var paName = UILabel()
    var timeStamp = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(avatarImageView)
        contentView.addSubview(customTeamName)
        contentView.addSubview(message)
        contentView.addSubview(paName)
        contentView.addSubview(timeStamp)

        avatarImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.width.equalTo(avatarImageView.snp.height)
            make.centerY.equalToSuperview()
            make.height.equalTo(contentView.snp.height)
        }
        customTeamName.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
            make.trailing.equalTo(timeStamp.snp.leading).priority(.low)
            make.topMargin.equalTo(contentView.snp.topMargin)
            make.bottom.equalTo(message.snp.top).offset(-5)

        }

        message.snp.makeConstraints { (make) in
            make.leading.equalTo(customTeamName.snp.leading)
            make.bottom.equalTo(paName.snp.top).offset(-5)

        }

        paName.snp.makeConstraints { (make) in
            make.leading.equalTo(customTeamName.snp.leading)
            make.bottomMargin.equalTo(contentView.snp.bottomMargin)
        }
        timeStamp.snp.makeConstraints { (make) in
            make.trailingMargin.equalTo(contentView.snp.trailingMargin).priority(.high)
            make.top.equalTo(customTeamName.snp.top)

        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {

    }
}

