//
//  SessionImageViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/5.
//  Copyright © 2018 JayKong. All rights reserved.
//

import SnapKit
import UIKit
class EFPSessionFullImageViewController: UIViewController {
    var imageView: UIImageView!
    var sessionImageViewModel: SessionImageViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.isUserInteractionEnabled = true

        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        imageView.addGestureRecognizer(tapgesture)

        sessionImageViewModel.galleryItem.drive(onNext: { [weak self] item in
            self?.imageView.image = UIImage(contentsOfFile: item.thumbPath)
        })
    }

    @objc func dismissViewController() {

        sessionImageViewModel.onDismissViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
