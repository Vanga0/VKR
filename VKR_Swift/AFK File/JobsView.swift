//
//  JobsView.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 04.01.2023.
//

//import SwiftUI
//import FirebaseAuth
//import FirebaseDatabase
//
//struct JobsView: View {
//    @ObservedObject var jobRequestViewModel = JobRequestViewModel()
//
//    var body: some View {
//        List(self.jobRequestViewModel.jobs) { job in
//            Text(job.title)
//        }
//    }
//}
//
//class JobRequestViewModel: ObservableObject {
//    @Published var jobs: [Job] = []
//
//    init() {
//        let user = Auth.auth().currentUser
//        let ref = Database.database().reference().child("jobs").child(user!.uid)
//        ref.observe(.value, with: { (snapshot) in
//            var jobs: [Job] = []
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                    let job = Job(snapshot: snapshot) {
//                    jobs.append(job)
//                }
//            }
//            self.jobs = jobs
//        })
//    }
//}
//
//struct Job {
//    var title: String
//    var description: String
//
//    init?(snapshot: DataSnapshot) {
//        guard let value = snapshot.value as? [String: String],
//            let title = value["title"],
//            let description = value["description"] else {
//                return nil
//        }
//
//        self.title = title
//        self.description = description
//    }
//}
//
//struct JobsView_Previews: PreviewProvider {
//    static var previews: some View {
//        JobsView()
//    }
//}
