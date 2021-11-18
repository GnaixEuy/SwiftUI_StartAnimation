//
//  NFCDemoView.swift
//  CyWeather
//
//  Created by 苏粤翔 on 2021/11/18.
//

import SwiftUI
import CoreNFC

struct NFCDemoView: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button {
                
            } label: {
                Text("read NFC")
                    .shadow(color: .red, radius: 4.0, x: 0, y: 0)
            }
            .background(.red)
        }
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        var tag: NFCTag? = nil
        
        for nfcTag in tags {
            // In this example you are searching for a MIFARE Ultralight tag (NFC Forum T2T tag platform).
            if case let .miFare(mifareTag) = nfcTag {
                if mifareTag.mifareFamily == .ultralight {
                    tag = nfcTag
                    break
                }
            }
        }
        
        if tag == nil {
            session.invalidate(errorMessage: "No valid coupon found.")
            return
        }
        
        session.connect(to: tag!) { (error: Error?) in
            if error != nil {
                session.invalidate(errorMessage: "Connection error. Please try again.")
                return
            }
            //            self.readCouponCode(from: tag!)
        }
    }
}

struct NFCDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NFCDemoView()
    }
}
