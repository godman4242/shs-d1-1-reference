package playerio
{
   import playerio.generated.Notifications;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.Notification;
   import playerio.generated.messages.NotificationsEndpoint;
   import playerio.generated.messages.NotificationsEndpointId;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   import playerio.utils.Utilities;
   
   public class Notifications extends playerio.generated.Notifications
   {
      
      private var _version:String;
      
      private var _myNotifications:Array;
      
      public function Notifications(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function get myNotifications() : Array
      {
         if(_myNotifications == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access \'myNotifications\' before refresh() is called.",playerio.PlayerIOError.NotificationsNotLoaded.errorID);
         }
         return _myNotifications;
      }
      
      public function refresh(callback:Function, errorCallback:Function) : void
      {
         _notificationsRefresh(_version,function(version:String, endpoints:Array):void
         {
            refreshed(version,endpoints);
            if(callback != null)
            {
               callback();
            }
         },errorCallback);
      }
      
      private function refreshed(version:String, notificationEndpointArray:Array) : void
      {
         var i:int = 0;
         var ne:NotificationEndpoint = null;
         var endpoints:Array = [];
         if(this._version != version)
         {
            this._version = version;
            if(notificationEndpointArray != null)
            {
               for(i = 0; i < notificationEndpointArray.length; )
               {
                  ne = new NotificationEndpoint();
                  ne._internal_initialize(notificationEndpointArray[i]);
                  endpoints.push(ne);
                  i++;
               }
            }
            this._myNotifications = endpoints;
         }
      }
      
      public function registerEndpoints(endpointType:String, identifier:String, configuration:Object, enabled:Boolean, callback:Function, errorCallback:Function) : void
      {
         var newEndpoint:NotificationsEndpoint;
         var current:NotificationEndpoint = get(endpointType,identifier);
         if(current == null || current.endabled != enabled || !areEqual(current.configuration,configuration))
         {
            newEndpoint = createChannelNotificationEndpoint(endpointType,identifier,configuration,enabled);
            _notificationsRegisterEndpoints(_version,[newEndpoint],function(version:String, endpoints:Array):void
            {
               refreshed(version,endpoints);
               if(callback != null)
               {
                  callback();
               }
            },errorCallback);
         }
         else if(callback != null)
         {
            callback();
         }
      }
      
      public function send(notifications:Array, callback:Function, errorCallback:Function) : void
      {
         if(notifications.length > 0)
         {
            _notificationsSend(convertNotification(notifications),callback,errorCallback);
         }
         else if(callback != null)
         {
            callback();
         }
      }
      
      public function toggleEndpoints(endpoints:Array, enable:Boolean, callback:Function, errorCallback:Function) : void
      {
         var ids:Array = convertNotificationEndpoint(endpoints);
         if(ids.length > 0)
         {
            _notificationsToggleEndpoints(this._version,ids,enable,function(version:String, newEndpoints:Array):void
            {
               refreshed(version,newEndpoints);
               if(callback != null)
               {
                  callback();
               }
            },errorCallback);
         }
         else if(callback != null)
         {
            callback();
         }
      }
      
      public function deleteEndpoints(endpoints:Array, callback:Function, errorCallback:Function) : void
      {
         var ids:Array = convertNotificationEndpoint(endpoints);
         if(ids.length > 0)
         {
            _notificationsDeleteEndpoints(this._version,ids,function(version:String, newEndpoints:Array):void
            {
               refreshed(version,newEndpoints);
               if(callback != null)
               {
                  callback();
               }
            },errorCallback);
         }
         else if(callback != null)
         {
            callback();
         }
      }
      
      private function createChannelNotificationEndpoint(endpointType:String, identifier:String, configuration:Object, enabled:Boolean) : NotificationsEndpoint
      {
         var newEndpoint:NotificationsEndpoint = new NotificationsEndpoint();
         newEndpoint.configuration = Converter.toKeyValueArray(configuration);
         newEndpoint.type = endpointType;
         newEndpoint.identifier = identifier;
         newEndpoint.enabled = enabled;
         return newEndpoint;
      }
      
      private function get(endpointType:String, identifier:String) : NotificationEndpoint
      {
         return _myNotifications == null ? null : Utilities.find(_myNotifications,function(endpoint:NotificationEndpoint):Boolean
         {
            if(endpoint.identifier == identifier && endpoint.type == endpointType)
            {
               return true;
            }
            return false;
         }) as NotificationEndpoint;
      }
      
      private function areEqual(a:Object, b:Object) : Boolean
      {
         if(Utilities.countKeys(a) == Utilities.countKeys(b))
         {
            for(var key in a)
            {
               if(a[key] != b[key])
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
      
      private function convertNotification(notifications:Array) : Array
      {
         var i:int = 0;
         var sN:playerio.generated.messages.Notification = null;
         var n:playerio.Notification = null;
         var serverNotificaions:Array = [];
         for(i = 0; i < notifications.length; )
         {
            sN = new playerio.generated.messages.Notification();
            n = notifications[i] as playerio.Notification;
            sN.data = Converter.toKeyValueArray(n.data);
            sN.recipient = n.recipientUserId;
            sN.endpointType = n.endpointType;
            serverNotificaions.push(sN);
            i++;
         }
         return serverNotificaions;
      }
      
      private function convertNotificationEndpoint(endpoints:Array) : Array
      {
         var i:int = 0;
         var endpointId:NotificationsEndpointId = null;
         var ids:Array = [];
         if(endpoints == null)
         {
            return ids;
         }
         for(i = 0; i < endpoints.length; )
         {
            endpointId = new NotificationsEndpointId();
            endpointId.identifier = (endpoints[i] as NotificationEndpoint).identifier;
            endpointId.type = (endpoints[i] as NotificationEndpoint).type;
            ids.push(endpointId);
            i++;
         }
         return ids;
      }
   }
}

