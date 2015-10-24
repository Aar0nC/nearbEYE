//
//  CameraOverlayView.swift
//  NearbEYE
//
//  Created by Ethan Hardy on 2015-10-24.
//  Copyright © 2015 Stephen Melinyshyn. All rights reserved.
//

import UIKit

class CameraOverlayView: UIView {

    var attractionsList : UITableView!
    
    init(frame: CGRect, vc: CameraViewController) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        configureTableView(vc)
        let swipeRecog = UISwipeGestureRecognizer(target: self, action: "hideOrShowTableView:")
        swipeRecog.direction = UISwipeGestureRecognizerDirection.Up
        self.addGestureRecognizer(swipeRecog)
        self.addSubview(UIButton(frame: CGRectMake(30,30,60,60)))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureTableView(vc: CameraViewController) {
        attractionsList = UITableView(frame: CGRectMake(20, self.frame.height / 2 - 60, self.frame.width - 40, self.frame.height / 2 + 60), style: UITableViewStyle.Plain)
        attractionsList.delegate = vc
        attractionsList.dataSource = vc
        attractionsList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "attraction")
        attractionsList.backgroundColor = UIColor.clearColor()
        self.addSubview(attractionsList)
    }
    
    func hideOrShowTableView(recog: UISwipeGestureRecognizer) {
        if (recog.direction == UISwipeGestureRecognizerDirection.Up) {
            recog.direction = UISwipeGestureRecognizerDirection.Down
            UIView.animateWithDuration(NSTimeInterval(200.0/1000.0), animations: { () -> Void in
                self.frame.origin.y -= self.frame.height / 2 - 60
            })
        }
        else {
            recog.direction = UISwipeGestureRecognizerDirection.Up
            UIView.animateWithDuration(NSTimeInterval(200.0/1000.0), animations: { () -> Void in
                self.frame.origin.y += self.frame.height / 2 - 60
            })
        }
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
