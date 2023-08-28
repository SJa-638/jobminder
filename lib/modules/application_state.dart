// dart class
class ApplicationState {
  final JobStatus jobStatuses;
  final DateTime deadline;
  final DateTime update;

  ApplicationState(this.jobStatuses, this.deadline, this.update);

}

enum JobStatus {
  jobForm, 
  technicalAssessment,
  interview,
}
