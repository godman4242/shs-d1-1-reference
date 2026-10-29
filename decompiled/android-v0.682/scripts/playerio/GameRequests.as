package playerio
{
   import playerio.generated.GameRequests;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.WaitingGameRequest;
   import playerio.utils.HTTPChannel;
   import playerio.utils.Utilities;
   
   public class GameRequests extends playerio.generated.GameRequests
   {
      
      private var _waitingRequests:Array;
      
      public function GameRequests(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function get waitingRequests() : Array
      {
         if(_waitingRequests == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access requests before refresh() has been called.",playerio.PlayerIOError.GameRequestsNotLoaded.errorID);
         }
         return _waitingRequests;
      }
      
      public function send(requestType:String, requestData:Object, recipients:Array, callback:Function, errorCallback:Function) : void
      {
         _gameRequestsSend(requestType,requestData,recipients,callback,errorCallback);
      }
      
      public function refresh(callback:Function, errorCallback:Function) : void
      {
         _gameRequestsRefresh(null,function(requests:Array, moreRequestsWaiting:Boolean, playCodes:Array):void
         {
            read(requests,moreRequestsWaiting);
            if(callback != null)
            {
               callback();
            }
         },errorCallback);
      }
      
      public function remove(requests:Array, callback:Function, errorCallback:Function) : void
      {
         _gameRequestsDelete(requestArrayToRequestIdArray(requests),function(requests:Array, moreWaitingRequests:Boolean):void
         {
            read(requests,moreWaitingRequests);
            if(callback != null)
            {
               callback();
            }
         },errorCallback);
      }
      
      public function showSendDialog(requestType:String, requestData:Object, callback:Function) : void
      {
         var args:Object = {};
         args["requestType"] = requestType;
         args["requestData"] = StringForm.encodeStringDictionary(requestData);
         Yahoo._internal_showDialog("sendgamerequest",args,channel,function(result:Object):void
         {
            var grsd:GameRequestSendDialogResult = null;
            if(callback != null)
            {
               grsd = new GameRequestSendDialogResult();
               grsd._internal_initialize(result["recipients"] != undefined ? StringForm.decodeStringArray(result["recipients"]) : [],result["recipientCountExternal"] != undefined ? int(result["recipientCountExternal"]) : 0);
               callback(grsd);
            }
         });
      }
      
      private function requestArrayToRequestIdArray(requests:Array) : Array
      {
         var i:int = 0;
         var requestIdArray:Array = [];
         for(i = 0; i < requests.length; )
         {
            requestIdArray.push((requests[i] as GameRequest)._internal_id);
            i++;
         }
         return requestIdArray;
      }
      
      private function read(requests:Array, moreRequestsWaiting:Boolean) : Boolean
      {
         var i:int;
         var item:WaitingGameRequest;
         var gr:GameRequest;
         var anyNew:Boolean = false;
         var array:Array = [];
         if(requests != null)
         {
            for(i = 0; i < requests.length; )
            {
               item = requests[i];
               gr = new GameRequest();
               gr._internal_initialize(item);
               array.push(gr);
               if(_waitingRequests != null)
               {
                  anyNew = anyNew || Utilities.find(_waitingRequests,function(request:GameRequest):Boolean
                  {
                     return request._internal_id == item.id;
                  }) == null;
               }
               i = i + 1;
            }
         }
         this._waitingRequests = array;
         return anyNew;
      }
   }
}

