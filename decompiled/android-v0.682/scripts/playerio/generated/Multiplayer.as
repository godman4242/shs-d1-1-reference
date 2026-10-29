package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.CreateJoinRoomArgs;
   import playerio.generated.messages.CreateJoinRoomError;
   import playerio.generated.messages.CreateJoinRoomOutput;
   import playerio.generated.messages.CreateRoomArgs;
   import playerio.generated.messages.CreateRoomError;
   import playerio.generated.messages.CreateRoomOutput;
   import playerio.generated.messages.JoinRoomArgs;
   import playerio.generated.messages.JoinRoomError;
   import playerio.generated.messages.JoinRoomOutput;
   import playerio.generated.messages.ListRoomsArgs;
   import playerio.generated.messages.ListRoomsError;
   import playerio.generated.messages.ListRoomsOutput;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   
   public class Multiplayer extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function Multiplayer(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      protected function _createRoom(roomId:String, roomType:String, visible:Boolean, roomData:Object, isDevRoom:Boolean, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:CreateRoomArgs = new CreateRoomArgs(roomId,roomType,visible,Converter.toKeyValueArray(roomData),isDevRoom);
         var output:CreateRoomOutput = new CreateRoomOutput();
         channel.Request(21,input,output,new CreateRoomError(),function(output:CreateRoomOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.roomId);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Multiplayer.createRoom",e);
                  throw e;
               }
            }
         },function(error:CreateRoomError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _joinRoom(roomId:String, joinData:Object, isDevRoom:Boolean, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:JoinRoomArgs = new JoinRoomArgs(roomId,Converter.toKeyValueArray(joinData),isDevRoom);
         var output:JoinRoomOutput = new JoinRoomOutput();
         channel.Request(24,input,output,new JoinRoomError(),function(output:JoinRoomOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.joinKey,output.endpoints);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Multiplayer.joinRoom",e);
                  throw e;
               }
            }
         },function(error:JoinRoomError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _listRooms(roomType:String, searchCriteria:Object, resultLimit:int, resultOffset:int, onlyDevRooms:Boolean, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:ListRoomsArgs = new ListRoomsArgs(roomType,Converter.toKeyValueArray(searchCriteria),resultLimit,resultOffset,onlyDevRooms);
         var output:ListRoomsOutput = new ListRoomsOutput();
         channel.Request(30,input,output,new ListRoomsError(),function(output:ListRoomsOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(Converter.toRoomInfoArray(output.rooms));
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Multiplayer.listRooms",e);
                  throw e;
               }
            }
         },function(error:ListRoomsError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _createJoinRoom(roomId:String, roomType:String, visible:Boolean, roomData:Object, joinData:Object, isDevRoom:Boolean, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:CreateJoinRoomArgs = new CreateJoinRoomArgs(roomId,roomType,visible,Converter.toKeyValueArray(roomData),Converter.toKeyValueArray(joinData),isDevRoom);
         var output:CreateJoinRoomOutput = new CreateJoinRoomOutput();
         channel.Request(27,input,output,new CreateJoinRoomError(),function(output:CreateJoinRoomOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.roomId,output.joinKey,output.endpoints);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Multiplayer.createJoinRoom",e);
                  throw e;
               }
            }
         },function(error:CreateJoinRoomError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
   }
}

