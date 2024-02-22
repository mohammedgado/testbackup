enum JobType {
  Remote,
  OnSite,
  Hybrid;


  static String toStringValue(String value) {
  switch (value) {
    case "1":
      return JobType.Remote.toString().split('.').last ;
    case "2":
      return JobType.OnSite.toString().split('.').last;
    case "3":
      return JobType.Hybrid.toString().split('.').last;
    default:
      return '';
  }
}

}

