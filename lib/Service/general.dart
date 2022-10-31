class General<T> {
  T? data;
  bool error;
  String? messageError;

  General({
    this.data,
    this.error = false,
     this.messageError,
  });
}
