//
//  BookQRReaderController.swift
//  Release-iOS
//
//  Created by 신지원 on 3/18/25.
//

import AVFoundation
import UIKit

final class BookQRReaderController: UIViewController {
    
    //MARK: - Properties
    
    private var entryType: EntryType
    private var bookId: String
    private var service: BookService
    
    private var captureSession: AVCaptureSession?
    private var isReading = false
    
    //MARK: - UI Components
    
    private let rootView = BookQRReaderView()
    
    //MARK: - Initializer
    
    init(entryType: EntryType, bookId: String, service: BookService) {
        self.entryType = entryType
        self.bookId = bookId
        self.service = service
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkCameraPermission()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setupCapture()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    granted ? self.setupCapture() : self.fail()
                }
            }
        default:
            fail()
        }
    }
    
    private func setupCapture() {
        let session = AVCaptureSession()
        
        //Input: 카메라가 있는 기기만 기기로 등록
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else {
            fail()
            return
        }
        session.addInput(input)
        
        //Output: metadataOutput으로 설정 불가능 시 Fail
        let output = AVCaptureMetadataOutput()
        guard session.canAddOutput(output) else {
            fail()
            return
        }
        
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr]
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        rootView.previewLayer = previewLayer
        
        session.startRunning()
        self.captureSession = session
    }
    
    //MARK: - Action
    
    private func fail() {
        print("카메라 사용 불가")
        showAlert(title: "QR 스캔 불가",
                  message: "카메라 사용이 불가능해요!\n관리자에게 문의해주세요.",
                  okAction: dismissAction)
    }
    
    private func found(code: String) {
        print("Found code: \(code)")
        captureSession?.stopRunning()
        // 전달 처리 (delegate or coordinator or viewModel)
    }

    private func dismissAction() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BookQRReaderController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard !isReading,
              let metadatObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              metadatObject.type == .qr,
              let stringValue = metadatObject.stringValue else { return }
        
        isReading = true
        found(code: stringValue)
    }
}
