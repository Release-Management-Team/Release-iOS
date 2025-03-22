//
//  BookQRReaderController.swift
//  Release-iOS
//
//  Created by 신지원 on 3/18/25.
//

import AVFoundation
import UIKit

enum LibraryOperation {
    case borrowBook
    case returnBook
}

final class BookQRReaderController: UIViewController {
    
    //MARK: - Properties
    
    private var libraryOperation: LibraryOperation
    private var bookId: String
    private var service: BookService
    
    private var captureSession: AVCaptureSession?
    private var isReading = false
    
    //MARK: - UI Components
    
    private let rootView = BookQRReaderView()
    
    //MARK: - Initializer
    
    init(libraryOperation: LibraryOperation, bookId: String, service: BookService) {
        self.libraryOperation = libraryOperation
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
        bindAction()
    }
    
    //MARK: - Camera
    
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
        
        ///카메라는 백그라운드에서 돌리도록 !
        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
        self.captureSession = session
    }
    
    //MARK: - Action
    
    private func bindAction() {
        self.rootView.backButton.addTarget(self,
                                           action: #selector(backButtonTapped),
                                           for: .touchUpInside)
    }
    
    private func fail() {
        print("카메라 사용 불가")
        showAlert(title: "QR 스캔 불가",
                  message: "카메라 사용이 불가능해요!\n관리자에게 문의해주세요.",
                  okAction: dismissAction)
    }
    
    private func found(code: String) {
        print("Found code: \(code)")
        captureSession?.stopRunning()
        
        Task {
            let isSuccess = await handleQRCode(code: code)
            
            if isSuccess {
                showAlert(title: "QR 처리 완료", message: "도서 처리가 성공적으로 완료되었습니다.") {
                    self.dismissAction()
                }
            } else {
                showAlert(title: "QR 처리 실패", message: "잠시 후 다시 시도해주세요.")
            }
        }
    }
    
    private func dismissAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Custom Method
    
    private func handleQRCode(code: String) async -> Bool {
        if libraryOperation == .borrowBook {
            do {
                try await service.postBookBorrow(bookId: bookId, qrCode: code)
                return true
            } catch {
                print("borrow failed: \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                try await service.postBookReturn(bookId: bookId, qrCode: code)
                return true
            } catch {
                print("return failed: \(error.localizedDescription)")
                return false
            }
        }
    }
}

//MARK: - AVCaptureMetadataOutputObjectsDelegate

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

//MARK: - API

extension BookQRReaderController {
    private func bookBorrow(qrCode: String) async {
        do {
            try await service.postBookBorrow(bookId: self.bookId, qrCode: qrCode)
        } catch {
            print("Borrowing Book failed: \(error.localizedDescription)")
        }
    }
    
    private func bookReturn(qrCode: String) async {
        do {
            try await service.postBookBorrow(bookId: self.bookId, qrCode: qrCode)
        } catch {
            print("Returning Book failed: \(error.localizedDescription)")
        }
    }
}
