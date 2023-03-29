//
//  CheckoutView.swift
//  iDine
//
//  Created by Alex Hutchins on 3/29/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let paymentTypes = ["Cash", " Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tip = (Double(tipAmount) / 100) * total
        return (total + tip).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    // place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
