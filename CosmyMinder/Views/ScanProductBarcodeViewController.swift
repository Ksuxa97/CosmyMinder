//
//  ScanProductBarcodeViewController.swift
//  CosmyMinder
//
//  Created by Kseniya Semenova on 29.08.2025.
//

import UIKit
import AVFoundation

final class ScanProductBarcodeViewController: UIViewController, ScanProductBarcodeViewControllerProtocol {

    //weak var delegate: ScanProductBarcodeDelegate?

    private let presenter: ScanProductBarcodePresenterProtocol
    private lazy var captureSession = AVCaptureSession()
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        return previewLayer
    }()

    private let highlightView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGreen.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 6
        view.isHidden = true
        return view
    }()

    init(presenter: ScanProductBarcodePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    func showAlert() {
        let alert = UIAlertController()
        alert.showAlert(.barcodeNotFound(cancelAction: navigateToCosmeticListView, addAction: navigateToAddNewProductManually))
    }

    func navigateToProductDetails(for product: BeautyProduct?) {
        let dataManager = DataManager()
        let productDetailsPresenter = AddNewProductManuallyPresenter(dataManager: dataManager)
        let productDetailsVC = AddNewProductManuallyViewController(presenter: productDetailsPresenter)
        productDetailsPresenter.view = productDetailsVC

        let imageURL = URL(string: product?.imageURL ?? "") ?? nil

        productDetailsVC.fieldsPrefill(
            imageURL,
            product?.name ?? "",
            product?.brand ?? "", "", "",
            product?.expiryDate ?? "")
        navigationController?.pushViewController(productDetailsVC, animated: true)
    }

    private func navigateToAddNewProductManually(_ action: UIAlertAction) -> Void {
        navigateToProductDetails(for: nil)
    }

    private func navigateToCosmeticListView(_ action: UIAlertAction) -> Void {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }

    private func setupCamera() {

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            print("❌ Камера недоступна")
            return
        }

        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
            print("❌ Не удалось получить доступ к камере")
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            print("❌ Failed to add video input")
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metadataOutput.metadataObjectTypes = [.ean13, .ean8, .code128, .qr]
        } else {
            print("❌ Failed to add metadata output")
            return
        }

        view.layer.addSublayer(previewLayer)
        view.addSubview(highlightView)
        captureSession.startRunning()
    }
}

extension ScanProductBarcodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let code = object.stringValue else {
            highlightView.isHidden = true
            return
        }

        if let transformedObject = previewLayer.transformedMetadataObject(for: object) {
            highlightView.frame = transformedObject.bounds
            highlightView.isHidden = false
        }

        captureSession.stopRunning()
        presenter.searchProductByBarcode(code)
    }
}
