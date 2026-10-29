package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.errors.*;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.*;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1461")]
   public class FriendBox extends MovieClip
   {
      
      public var rankpanel:MovieClip;
      
      public var loadingIcon:MovieClip;
      
      public var playerBust:PortraitBust;
      
      public var inviteText:TextField;
      
      public var button:RedButtonSmall;
      
      public var playerName:TextField;
      
      public var playerLevel:TextField;
      
      public var closeButton:SimpleButton;
      
      public var rank:TextField;
      
      internal var friendItem:FriendItem;
      
      internal var imageLoader:Loader;
      
      internal var tempHolder:String;
      
      public function FriendBox()
      {
         super();
         LangManager.initTextField(this.playerName,true);
         LangManager.initTextField(this.playerLevel);
         LangManager.initTextField(this.rank);
         this.button.addEventListeners();
         this.button.addEventListener(MouseEvent.CLICK,this.showPlayerPanel,false,0,true);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.removeFriend,false,0,true);
         this.loadingIcon.stop();
      }
      
      public function displayFriend(friendItem:FriendItem, index:int) : *
      {
         this.friendItem = friendItem;
         visible = true;
         if(friendItem.isLoaded())
         {
            this.showFriendItem();
         }
         else
         {
            this.playerName.text = LangManager.getString(90);
            this.playerLevel.text = "";
            this.inviteText.text = "";
            this.button.visible = false;
            this.loadingIcon.visible = true;
            this.loadingIcon.play();
            this.closeButton.visible = false;
            this.playerBust.visible = false;
            this.clearImageLoader();
            this.getFriendData();
         }
         this.rank.text = index.toString();
         this.rankpanel.visible = true;
      }
      
      internal function clearImageLoader() : *
      {
         if(this.imageLoader != null)
         {
            if(this.contains(this.imageLoader))
            {
               removeChild(this.imageLoader);
            }
            this.imageLoader = null;
         }
      }
      
      public function hide() : *
      {
         visible = false;
         this.playerBust.disposeMCSBust();
         this.playerBust.visible = true;
         this.clearImageLoader();
      }
      
      public function showInviteFriend() : *
      {
         visible = true;
         this.friendItem = null;
         this.playerName.text = "";
         this.inviteText.text = "Invite a\nfriend";
         this.playerLevel.text = "";
         this.playerBust.visible = true;
         this.playerBust.initMCSFromNPCID(0);
         this.playerBust.x = 22.5;
         this.closeButton.visible = false;
         this.loadingIcon.visible = false;
         this.loadingIcon.stop();
         this.clearImageLoader();
         this.button.setText(LangManager.getString(242));
         this.button.visible = true;
         this.rank.text = "";
         this.rankpanel.visible = false;
      }
      
      public function showSelf() : *
      {
         visible = true;
         this.playerName.text = LangManager.getString(280);
         this.playerLevel.text = LangManager.getString(241) + ": " + StatsManager.getPlayerStats(StatsManager.STAT_WINS);
         this.closeButton.visible = false;
         this.loadingIcon.visible = false;
         this.loadingIcon.stop();
         this.clearImageLoader();
         this.button.visible = false;
         this.inviteText.text = "";
         this.rank.textColor = 16763904;
         if(this.friendItem.isFacebook)
         {
            this.getFBFriendImage();
            this.playerBust.visible = false;
         }
         else
         {
            this.playerBust.visible = true;
            this.playerBust.initMCSFromEqString(StatsManager.getEquipmentString());
            this.playerBust.x = 22.5;
         }
      }
      
      public function isSelf() : Boolean
      {
         return this.playerName.text == LangManager.getString(280);
      }
      
      internal function showFriendItem() : *
      {
         if(this.friendItem.isFacebook)
         {
            if(this.friendItem.charname == StatsManager.charname)
            {
               this.showSelf();
               return;
            }
            this.getFBFriendImage();
            this.playerName.text = this.friendItem.username;
            this.closeButton.visible = false;
            this.playerBust.visible = false;
         }
         else
         {
            if(this.friendItem.charname == StatsManager.charname)
            {
               this.showSelf();
               return;
            }
            this.playerName.text = this.friendItem.charname;
            this.closeButton.visible = true;
            this.loadingIcon.visible = false;
            this.loadingIcon.stop();
            this.playerBust.visible = true;
            this.clearImageLoader();
         }
         this.playerLevel.text = LangManager.getString(241) + ": " + this.friendItem.wins;
         this.playerBust.initMCSFromEqString(this.friendItem.equipment);
         this.playerBust.x = 12.5;
         this.button.setText(LangManager.getString(239));
         this.button.visible = true;
         this.playerName.multiline = false;
         this.inviteText.text = "";
         this.rankpanel.visible = true;
         this.rank.textColor = 15658726;
      }
      
      internal function showPlayerPanel(event:MouseEvent) : *
      {
         if(this.playerName.text == "")
         {
            if(StatsManager.usePlayerIO)
            {
               QueryManagerPIO.instance.fbRequest(QueryManager.instance.username + " " + LangManager.getString(244));
            }
            else
            {
               ExternalInterface.call("makeRequest",QueryManager.instance.username + " " + LangManager.getString(244));
            }
         }
         else if(GameEngine.isAdventureMode() && (!InputManager.isDisabled() || OverworldHUD.instance.playerPanelDisplay.visible) && !OverworldHUD.instance.giveCoinsDialog.visible && StageManager.getRoomPrivate() != 8)
         {
            OverworldHUD.instance.playerPanelDisplay.showFriend(this.friendItem);
         }
      }
      
      internal function removeFriend(event:MouseEvent) : *
      {
         OverworldHUD.instance.friendpanel.removeFriend(this.friendItem.id);
         if(OverworldHUD.instance.playerPanelDisplay.visible && OverworldHUD.instance.playerPanelDisplay.ppid == this.friendItem.id)
         {
            OverworldHUD.instance.playerPanelDisplay.refresh();
         }
      }
      
      internal function getFriendData() : *
      {
         var key:String = null;
         if(StatsManager.usePlayerIO)
         {
            if(this.friendItem.isFacebook)
            {
               key = this.friendItem.charname;
            }
            else
            {
               key = this.friendItem.id;
            }
            if(key == StatsManager.charname)
            {
               this.getFriendDataCompletePIO(QueryManagerPIO.instance.playerData);
            }
            else if(key != null)
            {
               QueryManagerPIO.instance.client.bigDB.load("PlayerData",key,this.getFriendDataCompletePIO);
            }
            return;
         }
         var request:URLRequest = new URLRequest(QueryManager.instance.server + "getfrienddata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         if(this.friendItem.isFacebook)
         {
            variables.username = this.friendItem.username;
         }
         else
         {
            variables.id = this.friendItem.id;
         }
         variables.magicnum = QueryManager.instance.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getFriendDataComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getFriendDataIOError);
         loader.load(request);
      }
      
      internal function getFriendDataComplete(event:Event) : void
      {
         var friendPanel:FriendPanel = null;
         var gotFriendItem:FriendItem = null;
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(QueryManager.instance.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               if(this.friendItem.isFacebook && vars.username == this.friendItem.username || vars.id == this.friendItem.id)
               {
                  this.friendItem.initData(vars);
                  this.showFriendItem();
               }
               else
               {
                  friendPanel = parent as FriendPanel;
                  gotFriendItem = friendPanel.getFriendItem(vars.id);
                  if(gotFriendItem != null)
                  {
                     gotFriendItem.initData(vars);
                  }
               }
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
               break;
            case "3":
               trace("friend not found");
               if(!this.friendItem.isFacebook)
               {
                  this.removeFriend(null);
               }
         }
      }
      
      internal function getFriendDataCompletePIO(o:DatabaseObject) : *
      {
         var friendPanel:FriendPanel = null;
         var gotFriendItem:FriendItem = null;
         if(o == null || o.equipment == null)
         {
            if(!this.friendItem.isFacebook)
            {
               this.removeFriend(null);
            }
            else if(o != null)
            {
               o.equipment = "";
            }
            return;
         }
         if(this.friendItem.isFacebook && o.key == this.friendItem.charname || o.key == this.friendItem.id)
         {
            this.friendItem.initDataPIO(o);
            this.showFriendItem();
         }
         else
         {
            friendPanel = parent as FriendPanel;
            gotFriendItem = friendPanel.getFriendItem(o.key);
            if(gotFriendItem != null)
            {
               gotFriendItem.initDataPIO(o);
            }
         }
      }
      
      internal function getFriendDataIOError(event:IOErrorEvent) : void
      {
         trace("getFriendData IO error");
      }
      
      internal function getFBFriendImage() : *
      {
         if(this.imageLoader != null && this.contains(this.imageLoader))
         {
            removeChild(this.imageLoader);
         }
         var request:URLRequest = new URLRequest("http://graph.facebook.com/" + this.friendItem.facebookID + "/picture");
         this.tempHolder = this.friendItem.facebookID;
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         loader.addEventListener(Event.COMPLETE,this.getFBFriendImageComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getFBFriendImageIOError);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.getFBFriendImageSecurityError);
         loader.load(request);
      }
      
      internal function getFBFriendImageComplete(event:Event) : void
      {
         if(!this.tempHolder == this.friendItem.facebookID)
         {
            this.tempHolder = null;
            return;
         }
         this.tempHolder = null;
         var loader:URLLoader = URLLoader(event.target);
         var byteArray:ByteArray = loader.data;
         this.imageLoader = new Loader();
         this.imageLoader.loadBytes(byteArray);
         addChild(this.imageLoader);
         this.imageLoader.x = 27;
         this.imageLoader.y = 35;
         this.loadingIcon.visible = false;
         this.loadingIcon.stop();
      }
      
      internal function getFBFriendImageIOError(event:IOErrorEvent) : void
      {
         trace("getFBFriendImage IO error");
      }
      
      internal function getFBFriendImageSecurityError(event:SecurityErrorEvent) : void
      {
         trace("getFBFriendImage Security error");
      }
   }
}

