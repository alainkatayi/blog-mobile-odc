class CreationCompteState {
  bool isLoading;
  String? errorMsg;
  bool ?   isSuccess = false;

  CreationCompteState({
    this.isLoading = false,
    this.errorMsg,
    this.isSuccess,
  });

  CreationCompteState copyWith({
    bool? isLoading,
    String? errorMsg,
    bool?   isSuccess
  }) =>
      CreationCompteState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        isSuccess:isSuccess?? this.isSuccess,
      );
}
