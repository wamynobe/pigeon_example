import Flutter
import UIKit

extension FlutterError : Error {
    
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller = window?.rootViewController as! FlutterViewController
        let api = FlutterHostApiImpl()
        FlutterHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: api)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class FlutterHostApiImpl : FlutterHostApi {
    func saveData(data: DataModel, completion: @escaping (Result<Void, Error>) -> Void) {
        print("received data model")
        print("name : \(data.name), age : \(data.age)")
    }
    
    func getBattery(completion: @escaping (Result<Int64, any Error>) -> Void) {
        let device = UIDevice.current
            device.isBatteryMonitoringEnabled = true
            guard device.batteryState != .unknown  else {
                completion(Result.failure(FlutterError(code: "code", message: "message", details: nil)))
              return
            }
        completion(Result.success(Int64(device.batteryLevel * 100)))
    }
    
    
}
