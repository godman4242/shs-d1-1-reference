package playerio
{
   public class RoomInfo
   {
      
      private var _id:String;
      
      private var _roomType:String;
      
      private var _onlineUsers:int;
      
      private var _roomData:Object;
      
      public function RoomInfo(id:String, roomType:String, onlineUsers:int, roomData:Object)
      {
         super();
         _id = id;
         _roomType = roomType;
         _onlineUsers = onlineUsers;
         _roomData = roomData;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get serverType() : String
      {
         trace("serverType is deprecated, please use roomType.");
         return _roomType;
      }
      
      public function get roomType() : String
      {
         return _roomType;
      }
      
      public function get onlineUsers() : int
      {
         return _onlineUsers;
      }
      
      public function get initData() : Object
      {
         trace("initData is deprecated, please use data.");
         return _roomData;
      }
      
      public function get data() : Object
      {
         return _roomData;
      }
      
      public function toString() : String
      {
         var ret:String = "[playerio.RoomInfo]\n";
         ret += "id:\t\t\t\t" + id + "\n";
         ret += "roomType:\t\t" + roomType + "\n";
         ret += "onlineUsers:\t" + onlineUsers + "\n";
         ret += "initData:\t\tId\t\t\t\t\t\tValue\n";
         ret += "\t\t\t\t-------------------------------------------\n";
         for(var key in initData)
         {
            ret += "\t\t\t\t" + key + "\t\t\t\t\t".substring(key.length / 4) + "\t" + initData[key] + "\n";
         }
         return ret;
      }
   }
}

