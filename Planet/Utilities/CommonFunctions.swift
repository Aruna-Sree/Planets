//
//  CommonFunctions.swift
//  Planet
//
//  Created by Aruna Yarra on 04/01/19.
//  Copyright © 2019 Aruna Yarra. All rights reserved.
//

import UIKit

class CommonFunctions {
    //Typed functions
    
    //MARK: ShowActivityIndicator
    static var container: UIView?
    static let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    class func showActivityIndicatorInView(view: UIView, backgroundColor: UIColor) {
        container = UIView()
        container?.frame = view.frame
        container?.center = view.center
        container?.backgroundColor = backgroundColor
        
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actInd.center = view.center
        actInd.style = UIActivityIndicatorView.Style.whiteLarge
        container?.addSubview(actInd)
        view.addSubview(container!)
        actInd.startAnimating()
    }
    
    //MARK: HideActivityIndicator
    class func removeActivityIndicatorInView () {
        actInd.stopAnimating()
        container?.removeFromSuperview()
    }
    
    class func hideScrollIndicatorsOfTableView(tableView: UITableView) {
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
    }
}
