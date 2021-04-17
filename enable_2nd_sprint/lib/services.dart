import './includes.dart';

class Service {
  ServiceList serv;
  ServiceStatus status;
  var timeSLA = Stopwatch();
  var slaDuraton = Duration();
  void StartTSLA() {
    timeSLA.start();
  }

  void EndTSLA() {
    slaDuraton = timeSLA.elapsed;
    timeSLA.stop();
  }

  Service(ServiceList s) {
    this.serv = s;
  }
  void ModifyStatus(ServiceStatus s) {
    this.status = s;
  }
}
