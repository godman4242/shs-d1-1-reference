package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1443")]
   public class FriendPanel extends MovieClip
   {
      
      public var fbButton:RedButton;
      
      public var nextFriendButton:SimpleButton;
      
      public var friendsButton:RedButton;
      
      public var previousFriendButton:SimpleButton;
      
      internal var friendList:Array;
      
      internal var fbFriendList:Array;
      
      internal var friendBoxList:Array;
      
      internal var friendIndex:int = 0;
      
      internal var mode:int = 0;
      
      internal var boxnum:int = 5;
      
      internal var hasInit:Boolean = false;
      
      public function FriendPanel()
      {
         var friendBox:FriendBox = null;
         var i:int = 0;
         this.friendBoxList = new Array();
         super();
         for(i = 0; i < 6; i++)
         {
            friendBox = new FriendBox();
            this.addChild(friendBox);
            friendBox.y = 4;
            friendBox.x = 32 + i * 120;
            this.friendBoxList.push(friendBox);
            if(i == 5)
            {
               friendBox.showInviteFriend();
               friendBox.x = 683;
            }
         }
         this.hideAll();
      }
      
      public function hideAll() : *
      {
         for(var i:int = 0; i < 6; i++)
         {
            this.friendBoxList[i].visible = false;
         }
         this.previousFriendButton.visible = false;
         this.nextFriendButton.visible = false;
         this.fbButton.visible = false;
         this.friendsButton.visible = false;
      }
      
      public function init() : *
      {
         var insideArray:Array = null;
         var friendItem:FriendItem = null;
         if(this.hasInit || !StatsManager.stageShowingFriendBar)
         {
            return;
         }
         this.friendList = new Array();
         var friendListArray:Array = StatsManager.friendList.split("|");
         for(var i:int = 0; i < friendListArray.length; i++)
         {
            if(friendListArray[i] != "" && friendListArray[i] != "-")
            {
               insideArray = friendListArray[i].split(",");
               friendItem = new FriendItem(insideArray[0]);
               if(insideArray.length == 2)
               {
                  friendItem.setFriend(insideArray[0],insideArray[1]);
               }
               this.friendList.push(friendItem);
            }
         }
         friendItem = new FriendItem(StatsManager.id);
         if(StatsManager.usePlayerIO)
         {
            friendItem.setFriend(StatsManager.charname,StatsManager.getPlayerStats(StatsManager.STAT_WINS));
         }
         else
         {
            friendItem.setFriend(StatsManager.id,StatsManager.getPlayerStats(StatsManager.STAT_WINS));
         }
         this.friendList.push(friendItem);
         this.friendList.sortOn("wins",Array.NUMERIC);
         this.friendList.reverse();
         this.fbFriendList = new Array();
         var fbFriendListArray:Array = StatsManager.facebookFriends.split("|");
         for(i = 0; i < fbFriendListArray.length; i++)
         {
            if(fbFriendListArray[i] != "")
            {
               insideArray = fbFriendListArray[i].split(",");
               friendItem = new FriendItem("-1");
               if(insideArray.length > 3)
               {
                  friendItem.setFacebook(insideArray[0],insideArray[1],insideArray[2],insideArray[3]);
               }
               else
               {
                  friendItem.setFacebook(insideArray[0],insideArray[1],insideArray[2],insideArray[3]);
               }
               this.fbFriendList.push(friendItem);
            }
         }
         friendItem = new FriendItem("-1");
         if(StatsManager.usePlayerIO)
         {
            friendItem.setFacebook(StatsManager.facebookid,StatsManager.charname,StatsManager.getPlayerStats(StatsManager.STAT_WINS),StatsManager.charname);
         }
         else
         {
            friendItem.setFacebook(StatsManager.facebookid,QueryManager.instance.username,StatsManager.getPlayerStats(StatsManager.STAT_WINS));
         }
         this.fbFriendList.push(friendItem);
         this.fbFriendList.sortOn("wins",Array.NUMERIC);
         this.fbFriendList.reverse();
         this.friendIndex = 0;
         this.addEventListeners();
         this.fbButton.setText(LangManager.getString(236));
         this.friendsButton.setText(LangManager.getString(237));
         if(StatsManager.facebookid == "")
         {
            this.mode = 0;
            this.fbButton.visible = false;
            this.friendsButton.visible = false;
            this.boxnum = 5;
         }
         else
         {
            this.mode = 1;
            this.fbButton.visible = true;
            this.friendsButton.visible = true;
         }
         this.showFriends(this.friendIndex);
         this.hasInit = true;
      }
      
      public function closePanel() : *
      {
         if(this.friendList != null)
         {
            this.friendList.length = 0;
         }
         this.removeEventListeners();
         this.hideAll();
      }
      
      public function getFriendListStr() : String
      {
         if(this.friendList == null)
         {
            return "";
         }
         var str:String = "";
         for(var i:int = 0; i < this.friendList.length; i++)
         {
            if(this.friendList[i].id != StatsManager.id)
            {
               str = str + this.friendList[i].id + "|";
            }
         }
         return str;
      }
      
      public function addFriend(id:String) : *
      {
         if(this.friendList.length >= 50)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(870),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         this.friendList.push(new FriendItem(id));
         if(this.mode == 0)
         {
            this.showFriends(this.friendIndex);
         }
         QueryManager.instance.reportDataModified(StatsManager.FRIENDLIST);
         QueryManager.instance.saveModifiedCharData();
      }
      
      public function removeFriend(id:String) : *
      {
         var index:int = -1;
         var max:int = int(this.friendList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.friendList[i].id == id)
            {
               index = i;
               break;
            }
         }
         if(index != -1)
         {
            this.friendList.splice(index,1);
         }
         this.showFriends(this.friendIndex);
         QueryManager.instance.reportDataModified(StatsManager.FRIENDLIST);
         QueryManager.instance.saveModifiedCharData();
      }
      
      public function showFriends(index:int) : *
      {
         var array:Array = null;
         var friendBox:FriendBox = null;
         if(this.mode == 0)
         {
            array = this.friendList;
            this.friendBoxList[5].visible = false;
         }
         else if(this.mode == 1)
         {
            array = this.fbFriendList;
            this.friendBoxList[5].visible = true;
         }
         for(var i:int = 0; i < this.boxnum; i++)
         {
            friendBox = this.friendBoxList[i];
            if(index + i < array.length)
            {
               friendBox.displayFriend(array[i + index],i + index + 1);
            }
            else
            {
               friendBox.hide();
            }
         }
         this.previousFriendButton.visible = index > 0;
         this.nextFriendButton.visible = index < array.length - this.boxnum;
      }
      
      public function showNextFriend(event:MouseEvent) : *
      {
         var array:Array = null;
         if(this.mode == 0)
         {
            array = this.friendList;
         }
         else if(this.mode == 1)
         {
            array = this.fbFriendList;
         }
         if(this.friendIndex < array.length - 1)
         {
            ++this.friendIndex;
            this.showFriends(this.friendIndex);
         }
      }
      
      public function showPreviousFriend(event:MouseEvent) : *
      {
         if(this.friendIndex > 0)
         {
            --this.friendIndex;
            this.showFriends(this.friendIndex);
         }
      }
      
      public function refresh() : *
      {
         if(this.hasInit)
         {
            this.showFriends(this.friendIndex);
         }
      }
      
      public function refreshSelf() : *
      {
         for(var i:int = 0; i < this.friendBoxList.length; i++)
         {
            if(this.friendBoxList[i].isSelf())
            {
               this.friendBoxList[i].showSelf();
            }
         }
      }
      
      public function isFriend(id:*) : Boolean
      {
         for(var i:int = 0; i < this.friendList.length; i++)
         {
            if(this.friendList[i].id == id)
            {
               return true;
            }
         }
         return false;
      }
      
      public function addEventListeners() : *
      {
         this.previousFriendButton.addEventListener(MouseEvent.CLICK,this.showPreviousFriend);
         this.nextFriendButton.addEventListener(MouseEvent.CLICK,this.showNextFriend);
         this.fbButton.addEventListener(MouseEvent.CLICK,this.fbButtonClick);
         this.fbButton.addEventListeners();
         this.friendsButton.addEventListener(MouseEvent.CLICK,this.friendsButtonClick);
         this.friendsButton.addEventListeners();
      }
      
      public function removeEventListeners() : *
      {
         this.previousFriendButton.removeEventListener(MouseEvent.CLICK,this.showPreviousFriend);
         this.nextFriendButton.removeEventListener(MouseEvent.CLICK,this.showNextFriend);
         this.fbButton.removeEventListener(MouseEvent.CLICK,this.fbButtonClick);
         this.fbButton.removeEventListeners();
         this.friendsButton.removeEventListener(MouseEvent.CLICK,this.friendsButtonClick);
         this.friendsButton.removeEventListeners();
      }
      
      public function getFriendItem(id:String) : FriendItem
      {
         for(var i:int = 0; i < this.friendList.length; i++)
         {
            if(this.friendList[i].id == id)
            {
               return this.friendList[i];
            }
         }
         return null;
      }
      
      public function fbButtonClick(event:MouseEvent) : *
      {
         if(this.mode == 1)
         {
            return;
         }
         this.mode = 1;
         this.friendIndex = 0;
         this.showFriends(0);
      }
      
      public function friendsButtonClick(event:MouseEvent) : *
      {
         if(this.mode == 0)
         {
            return;
         }
         this.mode = 0;
         this.friendIndex = 0;
         this.showFriends(0);
      }
   }
}

