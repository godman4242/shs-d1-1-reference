package playerio
{
   import playerio.generated.PlayerIOError;
   import playerio.generated.PlayerInsight;
   import playerio.generated.messages.KeyValuePair;
   import playerio.generated.messages.PlayerInsightEvent;
   import playerio.generated.messages.PlayerInsightState;
   import playerio.utils.HTTPChannel;
   
   public class PlayerInsight extends playerio.generated.PlayerInsight
   {
      
      private var _state:PlayerInsightState = null;
      
      public function PlayerInsight(channel:HTTPChannel, client:Client, state:PlayerInsightState)
      {
         this._state = state;
         super(channel,client);
      }
      
      public function get playersOnline() : int
      {
         if(_state.playersOnline == -1)
         {
            throw new playerio.generated.PlayerIOError("The current connection does not have the rights required to read the playersonline variable.",3);
         }
         return _state.playersOnline;
      }
      
      public function getSegment(segmentGroup:String) : String
      {
         var a:int = 0;
         var cs:KeyValuePair = null;
         for(a = 0; a < _state.segments.length; )
         {
            cs = _state.segments[a];
            if(cs.key == segmentGroup)
            {
               return cs.value;
            }
            a++;
         }
         return null;
      }
      
      public function refresh(callback:Function = null, errorHandler:Function = null) : void
      {
         _playerInsightRefresh(function(state:PlayerInsightState):void
         {
            _state = state;
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function setSegments(segments:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         _playerInsightSetSegments(segments,function(state:PlayerInsightState):void
         {
            _state = state;
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function trackInvitedBy(invitingUserId:String, invitationChannel:String, callback:Function = null, errorHandler:Function = null) : void
      {
         _playerInsightTrackInvitedBy(invitingUserId,invitationChannel,callback,errorHandler);
      }
      
      public function trackEvents(events:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var a:int = 0;
         var ce:PlayerInsightEvent = null;
         var ee:Array = [];
         for(a = 0; a < events.length; )
         {
            ce = new PlayerInsightEvent();
            ce.eventType = events[a];
            ce.value = events[a + 1];
            ee.push(ce);
            a += 2;
         }
         _playerInsightTrackEvents(ee,callback,errorHandler);
      }
      
      public function trackExternalPayment(currency:String, amount:int, callback:Function = null, errorHandler:Function = null) : void
      {
         _playerInsightTrackExternalPayment(currency,amount,callback,errorHandler);
      }
   }
}

