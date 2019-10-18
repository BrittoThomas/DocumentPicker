//
//  ViewController.swift
//  Test
//
//  Created by Britto Thomas on 16/10/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import UIKit
import MobileCoreServices
import QuickLook

class ViewController: UIViewController {

    let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document", kUTTypePDF as String], in: .import)
    var documentURL:URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.documentPicker.delegate = self
        self.documentPicker.modalPresentationStyle = .formSheet
        
        
    }

    @IBAction func buttonAction(_ sender: Any) {
        self.present(self.documentPicker, animated: true, completion: nil)
    }

    
    
}

extension ViewController: UIDocumentPickerDelegate {

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        documentURL = urls.first
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true)
    }
}
    
extension ViewController: QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return documentURL != nil ? 1 : 0
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return documentURL! as QLPreviewItem
    }
}


