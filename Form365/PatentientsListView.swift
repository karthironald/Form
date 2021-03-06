//
//  PatentientsListView.swift
//  Form365
//
//  Created by Karthick Selvaraj on 30/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI

struct PatentientsListView: View {
    
    var maximumHeight: CGFloat = 300
    var div: CGFloat = 3.2
    @EnvironmentObject var patientsData: PatientsData
    @Binding var shouldShowPatientsList: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Surname").bold()
                    .frame(width: geo.size.width / self.div)
                    Spacer()
                    Text("Given Name").bold()
                    .frame(width: geo.size.width / self.div)
                    Spacer()
                    Text("Date of Birth").bold()
                    .frame(width: geo.size.width / self.div)
                }
                .frame(height: 50)
                .background(Color.black.opacity(0.2))
                List(self.patientsData.patients) { pat in
                    HStack {
                        Text(pat.surname)
                            .frame(width: geo.size.width / self.div)
                            .onTapGesture {
                                self.shouldShowPatientsList.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.handleSelected(patient: pat)
                                }
                        }
                        Spacer()
                        Text(pat.givenName)
                            .frame(width: geo.size.width / self.div)
                            .onTapGesture {
                                self.shouldShowPatientsList.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.handleSelected(patient: pat)
                                }
                        }
                        Spacer()
                        Text(pat.dob)
                            .frame(width: geo.size.width / self.div)
                            .onTapGesture {
                                self.shouldShowPatientsList.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.handleSelected(patient: pat)
                                }
                        }
                    }
                    .onTapGesture {
                        self.shouldShowPatientsList.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.handleSelected(patient: pat)
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }
            }
            .background(Color.black.opacity(0.1))
            .padding(0)
        }
        .frame(height: (50 * CGFloat(Patient.sampleData.count)) < self.maximumHeight ? (50 * CGFloat(Patient.sampleData.count)) : self.maximumHeight)
    }
    
    func handleSelected(patient: Patient) {
        patientsData.enteredSurname = patient.surname
        patientsData.enteredGivenName = patient.givenName
        patientsData.enteredDob = patient.dob
        patientsData.enteredSex = patient.sex
        patientsData.enteredPhoneNumber = patient.phoneNumber
        patientsData.enteredMedicareNumber = patient.medicareNumber
        patientsData.enteredHealthFund = patient.healthFund
        patientsData.enteredAddress = patient.address
        patientsData.enteredSuburb = patient.suburb
        patientsData.enteredPostcode = patient.postcode
    }
    
}

struct PatentientsListView_Previews: PreviewProvider {
    static var previews: some View {
        PatentientsListView(shouldShowPatientsList: .constant(false)).environmentObject(PatientsData())
    }
}
