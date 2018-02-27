//
//  EFPLocalHistorySessionViewController.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/25.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class EFPHistoryMessageDataProvider: NSObject, NIMKitMessageProvider {
    let session: NIMSession
    let message: NIMMessage

    init(session: NIMSession, message: NIMMessage) {
        self.session = session
        self.message = message
    }

    enum FetchError: Error {
        case localData
    }
    func pullDown(_ firstMessage: NIMMessage!, handler: NIMKitDataProvideHandler!) {

        let messages = NIMSDK.shared().conversationManager.messages(in: session, message: nil, limit: 0)
        if let handler = handler {
            handler(FetchError.localData, messages)
        }
    }
}

class EFPHistorySessionConfig: NSObject, NIMSessionConfig {
    let session: NIMSession
    let message: NIMMessage

    init(session: NIMSession, message: NIMMessage) {
        self.session = session
        self.message = message
    }

    func messageDataProvider() -> NIMKitMessageProvider! {
        let provider = EFPHistoryMessageDataProvider(session: session, message: message)
        return provider

    }

}

class EFPLocalHistorySessionViewController: NIMSessionViewController, BindableViewType {
    var viewModel: EFPLocalHistoryViewModel!

    func bindViewModel() {
    }

    typealias ViewModelType = EFPLocalHistoryViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.arrowBackBarBtn(target: self, action: #selector(pop))

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let items = interactor.items()
        let index = items?.index(where: { (item) -> Bool in
            if item is NIMMessageModel {
                let model = item as! NIMMessageModel
                if viewModel.message.messageId == model.message.messageId {
                    return true
                }
            }
            return false
        })

        if let index = index {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: false)

        }

    }

    override func sessionConfig() -> NIMSessionConfig! {
        let config = EFPHistorySessionConfig(session: session, message: viewModel.message)
        return config

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func pop() {
        viewModel.pop()
    }

}

