class InfoMsg {
  //late DateTime data;
  late String message;

  InfoMsg(
      //this.data,
      this.message);

  InfoMsg.fromMap(Map<dynamic, dynamic> mappa) {
    //data = mappa['data'];
    message = mappa['message'];
  }

}