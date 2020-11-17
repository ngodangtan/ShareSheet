//
//  ViewController.swift
//  ShareSheet
//
//  Created by Ngo Dang tan on 17/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(handlePresentShareSheet(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func handlePresentShareSheet(_ sender: UIButton){
        guard let image = UIImage(systemName: "bell"),let url = URL(string: "https://www.google.com") else {
            return
        }
        let shareSheetVC = UIActivityViewController(activityItems: [image,url], applicationActivities: nil)
        // Ipad support
        shareSheetVC.popoverPresentationController?.sourceView = sender
        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
        present(shareSheetVC, animated: true)
    }

}

