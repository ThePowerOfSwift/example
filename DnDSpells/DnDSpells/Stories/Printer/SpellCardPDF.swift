//
//  SpellCardPDF.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 10/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import PDFKit

class SpellCardPDF: PDFPage {
    var spell: Spell!
    
    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        super.draw(with: box, to: context)
        UIGraphicsPushContext(context)
        context.saveGState()
        
        //        let pageBounds = self.bounds(for: box)
        //        context.translateBy(x: 0.0, y: pageBounds.size.height)
        //        context.scaleBy(x: 1.0, y: -1.0)
        //        context.rotate(by: CGFloat.pi / 4.0)
        //
        //        let string: NSString = "U s e r   3 1 4 1 5 9"
        //        let attributes = [
        //            NSAttributedString.Key.foregroundColor: UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5),
        //            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 64)
        //        ]
        //
        //        string.draw(at: CGPoint(x:250, y:40), withAttributes: attributes)
        let path = UIBezierPath()
        path.lineWidth = 10
        path.move(to: CGPoint(x: 20, y: 20))
        path.addLine(to: CGPoint(x: 200, y: 200))
        UIColor.purple.setStroke()
        path.stroke()
        
        context.restoreGState()
        UIGraphicsPopContext()
    }
}
