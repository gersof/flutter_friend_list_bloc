import 'dart:async';

const MY_FRIENDS=['Krik','Tommy','James','Charles','Mary','Alissa','Carl'];

class FriendsBloc{
  Stream<List<String>> get getFriends async*{
      final List<String>  friends=[];
      for(String friend in  MY_FRIENDS){
          await Future.delayed(Duration(seconds: 3));
          friends.add(friend);
          yield friends;
      }
  }

  StreamController<int> _friendsCounter = new StreamController<int>();
  Stream<int> get myfriendsCounter => _friendsCounter.stream;

  FriendsBloc(){
    this.getFriends.listen((friendList) => this._friendsCounter.add(friendList.length));
  }

  dispose(){
    _friendsCounter.close();
  }
}