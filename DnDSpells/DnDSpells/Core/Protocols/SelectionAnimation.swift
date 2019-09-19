//
//  SelectionAnimation.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 14/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

enum SelectionState {
    case none
    case selected
    case error
}

protocol SelectionAnimation: AnyObject {
    var animationRun: Bool { get set }
    var currentSelectionState: SelectionState { get }
    var lineOfAnimation: UIView! { get }
    
    func selectionAnimation()
}

extension SelectionAnimation {
    func selectionAnimation() {
        guard !animationRun else { return }
        animationRun = true
        let slide: UIView
        let scaleX: CGFloat
        if currentSelectionState == .none {
            slide = UIView(frame: CGRect(x: 0, y: 1, width: lineOfAnimation.bounds.width, height: 2))
            let color = lineOfAnimation.backgroundColor ?? UIColor.Palette.lightBlueGrey
            slide.backgroundColor = UIColor.init(cgColor: color.cgColor)
            lineOfAnimation.backgroundColor = UIColor.Palette.lightBlueGrey
            slide.center = CGPoint(x: lineOfAnimation.center.x, y: 1)
            scaleX = 5 / lineOfAnimation.bounds.width
        } else {
            slide = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 2))
            switch currentSelectionState {
            case .none:
                ()
            case .selected:
                slide.backgroundColor = UIColor.Palette.dodgerBlue
            case .error:
                slide.backgroundColor = UIColor.Palette.error
            }
            slide.center = CGPoint(x: lineOfAnimation.center.x, y: 1)
            scaleX = lineOfAnimation.bounds.width / slide.frame.width
        }
        lineOfAnimation.addSubview(slide)
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            slide.transform = CGAffineTransform(scaleX: scaleX, y: 1)
        }) { [weak self] result in
            guard let `self` = self else { return }
            switch self.currentSelectionState {
            case .none:
                self.lineOfAnimation.backgroundColor = UIColor.Palette.lightBlueGrey
            case .selected:
                self.lineOfAnimation.backgroundColor = UIColor.Palette.dodgerBlue
            case .error:
                self.lineOfAnimation.backgroundColor = UIColor.Palette.error
            }
            slide.removeFromSuperview()
            self.animationRun = false
        }
    }
}

