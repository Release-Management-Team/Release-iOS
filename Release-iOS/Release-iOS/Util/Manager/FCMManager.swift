//
//  FCMManager.swift
//  Release-iOS
//
//  Created by 신지원 on 2/3/25.
//

import UIKit

import FirebaseCore
import FirebaseMessaging

class FCMManager: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {

    static let shared = FCMManager()

    private override init() {}

    /// FireBase 초기 설정
    func configure(application: UIApplication) {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self

        requestNotificationAuthorization()

        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
    }

    /// 알람권한 요청
    private func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .notDetermined {
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
                    if let error = error { print("\(error.localizedDescription)") }
                    print("\(granted)")
                }
            }
        }
    }

    /// APNs Token 업데이트
    func updateAPNsToken(_ deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }

    /// FCM Token 업데이트
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken, token != UserDefaults.standard.string(forKey: "fcmToken") else { return }

        UserDefaults.standard.set(token, forKey: "fcmToken")
        print("Firebase token updated: \(token)")

        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: ["token": token]
        )
    }
}

// MARK: FCM 서버 연결
extension FCMManager {
    private func sendFCMToken(token: String) {
        //UUID 출력 & 서버연결 코드
    }
}
