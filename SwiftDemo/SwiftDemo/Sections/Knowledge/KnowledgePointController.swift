//
//  KnowledgePoint.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/23.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class KnowledgePointController: UIViewController, UIWebViewDelegate {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        let fileURL = Bundle.main.path(forResource: "local", ofType: "html")
        let url = URL(string: fileURL!)!
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }
    
    //MARK: - WebView Delegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start loading...")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finish loading...")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("error happed...")
    }
    
    //MARK: - Private Propertys
    
    //MARK: - IB
    
    /// UI
    @IBOutlet weak var webView: UIWebView!
    
    
    
}
