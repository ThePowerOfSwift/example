//
//  PrinterVC.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 10/09/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import PDFKit
import QuartzCore

class PrinterVC: UIViewController {

    @IBOutlet var pdfContainer: UIView!
    private var pdfView: PDFView!
    private let service = SpellService.shared()
    private var spell: Spell!
    
    fileprivate func preparePDF() {
        pdfView = PDFView(frame: pdfContainer.bounds)
        pdfView.document = PDFDocument(data: createPDF())
        pdfView.autoScales = true
        pdfView.delegate = self
        pdfContainer.addSubview(pdfView)
    }
    
    fileprivate func createPDF() -> Data {
        let pdfMetaData = [
            kCGPDFContextAuthor: "eeemp",
            kCGPDFContextCreator: "eeemp"]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byWordWrapping
            // 2
            let textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: textFont
            ]
            let attributedText = NSAttributedString(
                string: spell.spellDescription,
                attributes: textAttributes
            )
            // 3
            let textRect = CGRect(
                x: 10,
                y: 10,
                width: 200,
                height: 500
            )
            attributedText.draw(in: textRect)
            let rectangle = UIBezierPath(rect: CGRect(x: 10, y: 10, width: 200, height: 500))
            UIColor.black.set()
            rectangle.stroke()
//            let attributes = [
//                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
//            ]
//            let text = spell.name
//            text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        }
        
        return data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spell = service.getAllSpell().first!
        preparePDF()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pdfView.frame = pdfContainer.bounds
    }

    @IBAction func touchPrint(_ sender: Any) {
        guard let pdfData = pdfView.document?.dataRepresentation() else { fatalError() }
        if UIPrintInteractionController.canPrint(pdfData) {
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = "Spell"
            printInfo.outputType = .photo
            
            let printController = UIPrintInteractionController.shared
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = false
            
            printController.printingItem = pdfData
            
            printController.present(animated: true, completionHandler: nil)
        } else {
            print("ERRRRRIOREIOREIJRIEO")
        }
    }
}

extension PrinterVC: PDFViewDelegate, PDFDocumentDelegate {
    func classForPage() -> AnyClass {
        return SpellCardPDF.self
    }
    
    
}
