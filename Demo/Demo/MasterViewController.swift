//
//  MasterViewController.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol MasterDelegate: JDCoordinatorViewControllerDelegate {
    func showDetail(withData data: String?)
    func close()
}

class MasterViewController: UIViewController {
    
    weak var delegate: MasterDelegate!

    @IBAction func btnPressed(_ sender: UIButton) {
        delegate.showDetail(withData: sender.title(for: .normal))
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        delegate.close()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        delegate?.presentedVC?(self, movedTo: parent)
    }

    
    deinit {
        NSLog("\(type(of: self)) got deinitialized")
    }
}