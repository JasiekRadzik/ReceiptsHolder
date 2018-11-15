//
//  MainView.swift
//  ReceiptsHolder
//
//  Created by Jan Radzikowski on 14/11/2018.
//  Copyright © 2018 Jan Radzikowski. All rights reserved.
//

import Foundation
import UIKit

class MainView: GeneralView {
    let topRightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return view
    }()
    
    let bottomLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var scrollViewBottomConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    var portraitConstraints : [NSLayoutConstraint] = []
    var landScapeConstraints : [NSLayoutConstraint] = []
    
    // Top View Portrait Constraints
    var topRightViewLeadingPortraitConstraint = NSLayoutConstraint()
    var topRightViewHeightPortraitConstraint = NSLayoutConstraint()
    var topRightViewWidthPortraitConstraint = NSLayoutConstraint()
    
    // Top View Landscape Constraints
    var topRightViewLeadingLandscapeConstraint = NSLayoutConstraint()
    var topRightViewHeightLandscapeConstraint = NSLayoutConstraint()
    var topRightViewWidthLandScapeConstraint = NSLayoutConstraint()
    
    // Bottom View Portrait Constraints
    var bottomLeftViewHeightPortraitConstraint = NSLayoutConstraint()
    var bottomLeftViewWidthPortraitConstraint = NSLayoutConstraint()
    var bottomLeftViewTopPortraitConstraint = NSLayoutConstraint()
    
    // Bottom View Landscape Constraints
    var bottomLeftViewHeightLandscapeConstraint = NSLayoutConstraint()
    var bottomLeftViewWidthLandscapeConstraint = NSLayoutConstraint()
    var bottomLeftViewTopLandscapeConstraint = NSLayoutConstraint()
    var bottomLeftViewLeadingLandscapeConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Blue Dark") ?? #colorLiteral(red: 0, green: 0.1450980392, blue: 0.1921568627, alpha: 1)
        
        let guide = self.safeAreaLayoutGuide
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topRightView)
        contentView.addSubview(bottomLeftView)
        
        // Scroll View (part of scroll view set up)
        scrollViewBottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: guide, attribute: .bottom, multiplier: 1.0, constant: 0)
        scrollViewBottomConstraint.isActive = true
        scrollView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        // Content View (part of scroll view set up)
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // Top Right View Constraints
        topRightView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        topRightViewLeadingPortraitConstraint = NSLayoutConstraint(item: topRightView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0)
        topRightViewHeightPortraitConstraint = NSLayoutConstraint(item: topRightView, attribute: .height, relatedBy: .equal, toItem: guide, attribute: .height, multiplier: 1/2, constant: 0)
        topRightViewWidthPortraitConstraint = NSLayoutConstraint(item: topRightView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0)
        topRightViewLeadingLandscapeConstraint = NSLayoutConstraint(item: topRightView, attribute: .leading, relatedBy: .equal, toItem: bottomLeftView, attribute: .trailing, multiplier: 1, constant: 0)
        topRightViewHeightLandscapeConstraint = NSLayoutConstraint(item: topRightView, attribute: .height, relatedBy: .equal, toItem: guide, attribute: .height, multiplier: 1, constant: 0)
        topRightViewWidthLandScapeConstraint = NSLayoutConstraint(item: topRightView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1/2, constant: 0)
        
        bottomLeftView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        bottomLeftView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        bottomLeftViewHeightPortraitConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .height, relatedBy: .equal, toItem: guide, attribute: .height, multiplier: 1/2, constant: 0)
        bottomLeftViewWidthPortraitConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0)
        bottomLeftViewTopPortraitConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .top, relatedBy: .equal, toItem: topRightView, attribute: .bottom, multiplier: 1, constant: 0)
        bottomLeftViewHeightLandscapeConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .height, relatedBy: .equal, toItem: guide, attribute: .height, multiplier: 1, constant: 0)
        bottomLeftViewWidthLandscapeConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1/2, constant: 0)
        bottomLeftViewTopLandscapeConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        bottomLeftViewLeadingLandscapeConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0)
        
        // other views added as subviews
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraintsToList() {
        // Portrait Constraints
        portraitConstraints.append(topRightViewLeadingPortraitConstraint)
        portraitConstraints.append(topRightViewHeightPortraitConstraint)
        portraitConstraints.append(topRightViewWidthPortraitConstraint)
        portraitConstraints.append(bottomLeftViewHeightPortraitConstraint)
        portraitConstraints.append(bottomLeftViewWidthPortraitConstraint)
        portraitConstraints.append(bottomLeftViewTopPortraitConstraint)
        
        // Landscape Constraints
        landScapeConstraints.append(topRightViewLeadingLandscapeConstraint)
        landScapeConstraints.append(topRightViewHeightLandscapeConstraint)
        landScapeConstraints.append(topRightViewWidthLandScapeConstraint)
        landScapeConstraints.append(bottomLeftViewHeightLandscapeConstraint)
        landScapeConstraints.append(bottomLeftViewWidthLandscapeConstraint)
        landScapeConstraints.append(bottomLeftViewTopLandscapeConstraint)
        landScapeConstraints.append(bottomLeftViewLeadingLandscapeConstraint)
    }
    
    func activatePortrait() {
        NSLayoutConstraint.deactivate(landScapeConstraints)
        NSLayoutConstraint.activate(portraitConstraints)
        scrollView.updateConstraints()
    }
    
    func activateLandscape() {
        NSLayoutConstraint.deactivate(portraitConstraints)
        NSLayoutConstraint.activate(landScapeConstraints)
        scrollView.updateConstraints()
    }
}
