class ResponseCall<T> {
  Status status;
  late T data;
  late String message;

  ResponseCall.loading(this.message) : status = Status.LOADING;
  ResponseCall.completed(this.data) : status = Status.COMPLETED;
  ResponseCall.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }