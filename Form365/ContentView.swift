//
//  ContentView.swift
//  Form365
//
//  Created by Karthick Selvaraj on 29/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI

let kAppContentBgUIColor = UIColor.systemGray5
let kAppContentBgColor = Color(kAppContentBgUIColor)
let kAppInputUIColor = UIColor.black.withAlphaComponent(0.70)
let kAppInputColor = Color(kAppInputUIColor)

struct ContentView: View {
    
    @State var ageName = ""
    @State private var textViewMessage = ""
    @State var vSpacing: CGFloat = 3
    @State var shouldShowPatientsList = false
    @State var shouldShowDoctorsList = false
    @State var shouldShowCopyToDoctorsList = false
    @ObservedObject var patientsData: PatientsData = PatientsData()
    @ObservedObject var doctorsData: DoctorsData = DoctorsData()
    @ObservedObject var copyToDoctorsData: DoctorsData = DoctorsData()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                Spacer()
                HStack(spacing: 20) {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Surename") + Text("*").foregroundColor(.red) }
                                .padding(.bottom, 0)
                            TextField("Surename", text: self.$patientsData.enteredSurname)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                                .onTapGesture {
                                    self.shouldShowPatientsList.toggle()
                            }
                            .popover(isPresented: $shouldShowPatientsList) {
                                PatentientsListView(shouldShowPatientsList: self.$shouldShowPatientsList)
                                    .environmentObject(self.patientsData)
                                    .frame(width: 500)
                            }
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Address")
                                .padding(.bottom, 0)
                            TextField("Address", text: self.$patientsData.enteredAddress)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Phone No.") + Text("*").foregroundColor(.red) }
                                .padding(.bottom, 0)
                            TextField("## #### ####", text: self.$patientsData.enteredPhoneNumber)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                    }
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Given name") + Text("*").foregroundColor(.red) }
                            TextField("Given name", text: self.$patientsData.enteredGivenName)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Suburb")
                            TextField("Suburb", text: self.$patientsData.enteredSuburb)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Medicare No.")
                            TextField("Medicare No.", text: self.$patientsData.enteredMedicareNumber)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                    }
                    VStack(spacing: 20) {
                        HStack {
                            VStack(alignment: .leading, spacing: self.vSpacing) {
                                HStack(alignment: .top) { Text("DOB") + Text("*").foregroundColor(.red) }
                                TextField("dd/mm/yyyy", text: self.$patientsData.enteredDob)
                                    .foregroundColor(kAppInputColor)
                                    .frame(height: 40)
                                    .padding([.leading, .trailing])
                                    .padding(.top, 0)
                                    .background(kAppContentBgColor)
                                    .cornerRadius(5)
                            }
                            VStack(alignment: .leading, spacing: self.vSpacing) {
                                Text("Sex")
                                TextField("Sex", text: self.$patientsData.enteredSex)
                                    .foregroundColor(kAppInputColor)
                                    .frame(height: 40)
                                    .padding([.leading, .trailing])
                                    .padding(.top, 0)
                                    .background(kAppContentBgColor)
                                    .cornerRadius(5)
                            }
                            .frame(width: 80)
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Postcode")
                            TextField("Postcode", text: self.$patientsData.enteredPostcode)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Health Fund")
                            TextField("Health Fund", text: self.$patientsData.enteredHealthFund)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                    }
                }
                .padding([.leading, .trailing], 20)
                VStack(alignment: .leading) {
                    Text("Health Record Update")
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(kAppContentBgColor)
                            .frame(width: 20, height: 20)
                        Text("Do not send reports to My Health Record")
                            .foregroundColor(kAppInputColor)
                    }
                }
                .padding([.leading, .trailing, .top, .bottom])
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Clinical notes") + Text("*").foregroundColor(.red) }
                            TextView(text: self.$textViewMessage)
                                .frame(height: 190)
                                .cornerRadius(5)
                        }
                        .padding([.leading, .trailing, .top])
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Tests Requested")
                            TextView(text: self.$textViewMessage)
                                .frame(height: 235)
                                .cornerRadius(5)
                        }
                        .padding([.leading, .trailing, .top])
                        HStack {
                            VStack(alignment: .leading, spacing: self.vSpacing + 10) {
                                Text("Urgent")
                                HStack {
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(kAppContentBgColor)
                                        .frame(width: 20, height: 20)
                                    Text("Yes")
                                        .foregroundColor(kAppInputColor)
                                }
                            }
                            .padding([.leading, .trailing])
                            .padding(.top, 5)
                            VStack(alignment: .leading, spacing: self.vSpacing) {
                                Text("Report Required By")
                                TextField("DD/MM/YYYY", text: self.$ageName)
                                    .foregroundColor(kAppInputColor)
                                    .frame(height: 40)
                                    .padding([.leading, .trailing])
                                    .padding(.top, 0)
                                    .background(kAppContentBgColor)
                                    .cornerRadius(5)
                            }
                            .padding([.trailing, .top])
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Doctor Name") + Text("*").foregroundColor(.red) }
                            TextView(text: self.$doctorsData.selectedDoctor.fullDetails, shouldAllowEdit: false)
                                .frame(height: 100)
                                .cornerRadius(5)
                                .onTapGesture {
                                    self.shouldShowDoctorsList.toggle()
                            }
                            .popover(isPresented: self.$shouldShowDoctorsList) {
                                DoctorsListView(shouldShowDoctorsList: self.$shouldShowDoctorsList)
                                    .environmentObject(self.doctorsData)
                                    .frame(width: 600)
                            }
                        }
                        .padding([.trailing, .top])
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Doctor's Phone") + Text("*").foregroundColor(.red) }
                            TextField("## #### ####", text: self.$doctorsData.selectedDoctor.phone)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        .padding([.trailing, .top])
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Copy To")
                            TextView(text: self.$copyToDoctorsData.selectedDoctor.fullDetails, shouldAllowEdit: false)
                                .frame(height: 100)
                                .cornerRadius(5)
                                .onTapGesture {
                                    self.shouldShowCopyToDoctorsList.toggle()
                            }
                            .popover(isPresented: self.$shouldShowCopyToDoctorsList) {
                                DoctorsListView(shouldShowDoctorsList: self.$shouldShowCopyToDoctorsList)
                                    .environmentObject(self.copyToDoctorsData)
                                    .frame(width: 600)
                            }
                        }
                        .padding([.trailing, .top])
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            HStack(alignment: .top) { Text("Doctor Signature") + Text("*").foregroundColor(.red) }
                            TextView(text: self.$textViewMessage, shouldAllowEdit: false)
                                .frame(height: 90)
                                .cornerRadius(5)
                        }
                        .padding([.trailing, .top])
                        VStack(alignment: .leading, spacing: self.vSpacing) {
                            Text("Date")
                            TextField("DD/MM/YYYY", text: self.$ageName)
                                .foregroundColor(kAppInputColor)
                                .frame(height: 40)
                                .padding([.leading, .trailing])
                                .padding(.top, 0)
                                .background(kAppContentBgColor)
                                .cornerRadius(5)
                        }
                        .padding([.trailing, .top])
                    }
                }
            }
            .padding([.bottom, .top])
        }
        .statusBar(hidden: true)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(height: 2000)
    }
}
