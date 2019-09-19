//
//  CustomTB.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 13/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

class CustomTB: UITabBarController {
    
    private var backgroundImageView: UIImageView!
    private var addButton: AddButton!
    private var menuList: UIView!
    
    fileprivate func prepareTabBarItems() {
        var imageEdgeTop = (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 7.0) / 2
        imageEdgeTop = imageEdgeTop == 0.0 ? 7.0 : imageEdgeTop
        
        let firstVC = SpellListVC()
        let firstItem = UITabBarItem(title: nil, image: UIImage(named: "listTB"), selectedImage: UIImage(named: "listTBS"))
        firstItem.imageInsets = UIEdgeInsets(top: imageEdgeTop, left: -10, bottom: -(imageEdgeTop), right: 10)
        firstVC.tabBarItem = firstItem
        
        let twoVC = SpellBookListVC()
        let twoItem = UITabBarItem(title: nil, image: UIImage(named: "spellBookTB"), selectedImage: UIImage(named: "spellBookTBS"))
        twoItem.imageInsets = UIEdgeInsets(top: imageEdgeTop, left: 10, bottom: -(imageEdgeTop), right: -10)
        twoVC.tabBarItem = twoItem
        
        viewControllers = [firstVC, twoVC]
    }
    
    fileprivate func prepareMenuList() {
        menuList = UIView(frame: tabBar.convert(addButton.frame, to: nil))
        menuList.backgroundColor = .white
        menuList.layer.cornerRadius = menuList.frame.height / 2
        menuList.layer.borderColor = UIColor.gray.cgColor
        menuList.layer.borderWidth = 1
        addChild(AddSpellToBookVC())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTabBarItems()
        backgroundImageView = UIImageView(image: UIImage(named: "backgroundTabBar"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let window = UIApplication.shared.windows.first
        let heightTabBar = tabBar.bounds.height + (window?.safeAreaInsets.bottom ?? 0.0)
        let heightButton = 56 * tabBar.bounds.width / 375
        addButton = AddButton(frame: CGRect(x: tabBar.center.x - heightButton / 2, y: -(heightButton / 2 - (10 * heightTabBar / 93)), width: heightButton, height: heightButton))
        addButton.addTarget(self, action: #selector(touchAddButton), for: .touchUpInside)
        backgroundImageView.frame = CGRect(x: tabBar.bounds.origin.x, y: tabBar.bounds.origin.y, width: tabBar.bounds.width, height: heightTabBar)
        
        tabBar.addSubview(backgroundImageView)
        tabBar.sendSubviewToBack(backgroundImageView)
        tabBar.addSubview(addButton)
    }
    
    @objc func touchAddButton() {
        if menuList == nil { prepareMenuList() }
        switch addButton.addState {
        case .disclosed:
            UIView.animate(withDuration: 0.25, animations: {
                self.addButton.transform = CGAffineTransform(rotationAngle: 0)
                self.addButton.backgroundColor = UIColor.button
                self.addButton.imageView!.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }) { _ in
                self.addButton.addState = .rolledUp
            }
            
        case .rolledUp:
            let rootView = UIApplication.shared.windows.first!.rootViewController!.view!
            menuList.alpha = 0
            rootView.addSubview(menuList)
            UIView.animate(withDuration: 0.25, animations: {
                self.menuList.frame = CGRect(x: 20, y: 100, width: 200, height: 200)
                self.menuList.alpha = 1
                self.addButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.addButton.backgroundColor = UIColor.white
                self.addButton.imageView!.tintColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 1)
            }){ _ in
                self.addButton.addState = .disclosed
            }
        }
    }
}
