//
//  ParallaxHeader.swift
//  ParallaxHeader
//
//  Created by David Sullivan on 18/02/2015.
//  Copyright (c) 2015 David Sullivan. All rights reserved.
//

import Foundation
import UIKit


public class ParallaxHeader {

    var headerView: UIView!
    var imageScrollView: UIScrollView!
    var imageView: UIImageView!
    var subView: UIView!
    var headerLabel: UILabel!
    
    private var parallaxDeltaFactor:CGFloat = 0.5
    private var tableHeaderHeight:CGFloat = 300.0
    private let labelPaddingDist:CGFloat = 8.0
    
    public init(){}

    
    public func parallaxHeaderViewWithImage(image: UIImage, headerSize: CGSize) -> (UIView) {
        headerView = UIView(frame: CGRectMake(0, 0, headerSize.width, headerSize.height))
        initialSetupForImageHeader(image)
        return headerView
    }
    
    public func parallaxHeaderViewWithView(subView: UIView) -> (UIView) {
        headerView = UIView(frame: CGRectMake(0, 0, subView.frame.size.width, subView.frame.size.height))
        initialSetupForViewHeader(subView)
        return headerView
    }
    
    
    public func layoutHeaderViewForScrollViewOffset(viewOffset: CGPoint!) {
        var frame = self.imageScrollView.frame
        
        if viewOffset.y > 0 {
            frame.origin.y = max(viewOffset.y*parallaxDeltaFactor, 0)
            self.imageScrollView.frame = frame
            self.headerView.clipsToBounds = true
        } else {
            var delta = 0.0
            var headerRect = CGRect(x: 0.0, y: 0.0, width: self.headerView.bounds.width, height: tableHeaderHeight)
            delta = fabs(min(Double(0.0), Double(viewOffset.y)))
            headerRect.origin.y -= CGFloat(delta)
            headerRect.size.height += CGFloat(delta)
            self.headerView.clipsToBounds = false
            self.imageScrollView.frame = headerRect
        }
    }
    
    private func initialSetupForImageHeader(image: UIImage){
        self.imageScrollView = UIScrollView(frame: headerView.bounds)
        self.imageView = UIImageView(frame: imageScrollView.bounds)
        imageView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.image = image
        imageScrollView.addSubview(imageView)
        
        var labelRect = CGRectMake(0, 0, headerView.frame.width, headerView.frame.height)
        labelRect.origin.x = labelPaddingDist
        labelRect.origin.y = labelPaddingDist
        labelRect.size.width = labelRect.size.width  - 2 * labelPaddingDist
        labelRect.size.height = labelRect.size.height  - 2 * labelPaddingDist
        
        self.headerLabel = UILabel(frame:labelRect)
        self.headerLabel.textAlignment = NSTextAlignment.Center
        self.headerLabel.numberOfLines = 0
        self.headerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.headerLabel.autoresizingMask = imageView.autoresizingMask
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont(name: "Arial", size: 50.0)
        imageScrollView.addSubview(headerLabel)
        
        headerView.addSubview(imageScrollView)
    }
    
    private func initialSetupForViewHeader(subView: UIView) {
        self.imageScrollView = UIScrollView(frame: headerView.bounds)
        self.subView = subView
        subView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        self.imageScrollView.addSubview(subView)
        
        headerView.addSubview(imageScrollView)
    }
    
    
}