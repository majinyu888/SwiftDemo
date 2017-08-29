//
//  CameraController.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/29.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//
/**
 http://www.appcoda.com/avfoundation-swift-guide/
 */

import UIKit
import AVFoundation

class CameraController {
    
    enum CameraControllerError: Swift.Error {
        case captureSessionAlreadyRunning
        case captureSessionIsMissing
        case inputsAreInvalid
        case invalidOperation
        case noCamerasAvailable
        case unknown
    }
    
    var captureSession: AVCaptureSession?
    var frontCamera: AVCaptureDevice?
    var rearCamera: AVCaptureDevice?
    
    func prepare(completionHandler: @escaping (Error?) -> Void) {
        
        func createCaptureSession() {
            self.captureSession = AVCaptureSession()
        }
        
        func configureCaptureDevice() throws {
            //1
            let session = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
            guard let cameras = (session?.devices.flatMap { $0 }), !cameras.isEmpty else { throw CameraControllerError.noCamerasAvailable }
            
            //2
            for camera in cameras {
                if camera.position == .front {
                    self.frontCamera = camera
                    _ = UIGestureRecognizer(target: self, action: nil)
                }
                
                if camera.position == .back {
                    self.rearCamera = camera
                    
                    try camera.lockForConfiguration()
                    camera.focusMode = .continuousAutoFocus
                    camera.unlockForConfiguration()
                }
            }
        }
        
        func configureDeviceInput() throws {
            _ = [String]()
        }
        
        func configurePhotoOutput() throws {
            
        }
        
        DispatchQueue(label: "prepare").async {
            do {
                createCaptureSession()
                try configureCaptureDevice()
                try configureDeviceInput()
                try configurePhotoOutput()
                
            } catch {
                DispatchQueue.main.async {
                    completionHandler(error)
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(nil)
            }
        }
    }
}
