//
//  DoctorsListView.swift
//  Form365
//
//  Created by Karthick Selvaraj on 30/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI

struct DoctorsListView: View {
    
    var maximumHeight: CGFloat = 300
    var div: CGFloat = 2.7
    @EnvironmentObject var doctorsData: DoctorsData
    @Binding var shouldShowDoctorsList: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Full name").bold()
                        .frame(width: geo.size.width / self.div)
                    Spacer()
                    Text("Spacility").bold()
                        .frame(width: geo.size.width / self.div)
                    Spacer()
                }
                .frame(height: 50)
                .background(kAppContentBgColor)
                List(self.doctorsData.doctors) { doc in
                    HStack {
                        Text(doc.displayName())
                            .frame(width: geo.size.width / self.div)
                            .onTapGesture {
                                self.shouldShowDoctorsList.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.handleSelected(doctor: doc)
                                }
                        }
                        Spacer()
                        Text(doc.spacility)
                            .frame(width: geo.size.width / self.div)
                            .onTapGesture {
                                self.shouldShowDoctorsList.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.handleSelected(doctor: doc)
                                }
                        }
                        if doc.id == self.doctorsData.selectedDoctor.id {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 20, height: 20)
                                .padding(.trailing, 10)
                        }
                    }
                    .onTapGesture {
                        self.shouldShowDoctorsList.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.handleSelected(doctor: doc)
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }
            }
                
            .padding(0)
        }
        .frame(height: (60 * CGFloat(Doctor.sampleData.count)) < self.maximumHeight ? (60 * CGFloat(Doctor.sampleData.count)) : self.maximumHeight)
    }
    
    func handleSelected(doctor: Doctor) {
        doctorsData.selectedDoctor = doctor
    }
    
}

struct DoctorsListView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsListView(shouldShowDoctorsList: .constant(false))
            .environmentObject(DoctorsData())
    }
}
