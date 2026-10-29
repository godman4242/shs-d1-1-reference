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
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1725")]
   public class §1t5697s0§ extends MovieClip
   {
      
      public var button:§1t5070s0§;
      
      public var §1t5698s0§:SimpleButton;
      
      public var inviteText:TextField;
      
      public var §1t5700s0§:MovieClip;
      
      public var §1t5701s0§:§1t5368s0§;
      
      public var §1t5187s0§:§1t5632s0§;
      
      public var playerLevel:TextField;
      
      public var §1t5703s0§:TextField;
      
      public var rank:TextField;
      
      public var rankpanel:MovieClip;
      
      internal var §1t5705s0§:§1t398s0§;
      
      internal var §1t5706s0§:Loader;
      
      internal var §1t5719s0§:String;
      
      public function §1t5697s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5703s0§,true);
         §1t1521s0§.§1t9290s0§(this.playerLevel);
         §1t1521s0§.§1t9290s0§(this.rank);
         if(!§1t1523s0§.§1t9528s0§)
         {
            this.button.addEventListener(MouseEvent.CLICK,this.§1t5713s0§,false,0,true);
            this.§1t5701s0§.addEventListener(MouseEvent.CLICK,this.§1t5713s0§,false,0,true);
            this.§1t5698s0§.addEventListener(MouseEvent.CLICK,this.§1t5714s0§,false,0,true);
         }
         this.§1t5700s0§.stop();
         this.button.§1t5769s0§(§1t1521s0§.getString(239));
         this.§1t5701s0§.§1t5769s0§(§1t1521s0§.getString(239));
         this.§1t5701s0§.visible = false;
      }
      
      public function §1t5707s0§(param1:§1t398s0§, param2:int) : *
      {
         this.§1t5705s0§ = param1;
         visible = true;
         if(param1.isLoaded())
         {
            this.§1t5712s0§();
         }
         else
         {
            this.§1t5703s0§.text = §1t1521s0§.getString(90);
            this.playerLevel.text = "";
            this.inviteText.text = "";
            this.button.visible = false;
            this.§1t5700s0§.visible = true;
            this.§1t5700s0§.play();
            this.§1t5698s0§.visible = false;
            this.§1t5187s0§.visible = false;
            this.§1t5708s0§();
            this.§1t5715s0§();
         }
         this.rank.text = param2.toString();
         this.rankpanel.visible = true;
      }
      
      internal function §1t5708s0§() : *
      {
         if(this.§1t5706s0§ != null)
         {
            if(this.contains(this.§1t5706s0§))
            {
               removeChild(this.§1t5706s0§);
            }
            this.§1t5706s0§ = null;
         }
      }
      
      public function hide() : *
      {
         visible = false;
         this.§1t5187s0§.§1t5494s0§();
         this.§1t5187s0§.visible = true;
         this.§1t5708s0§();
      }
      
      public function §1t5709s0§() : *
      {
         visible = true;
         this.§1t5705s0§ = null;
         this.§1t5703s0§.text = "";
         this.inviteText.text = §1t1521s0§.getString(243);
         this.playerLevel.text = "";
         this.§1t5187s0§.visible = true;
         this.§1t5187s0§.§1t5489s0§(0);
         this.§1t5187s0§.x = 22.5;
         this.§1t5698s0§.visible = false;
         this.§1t5700s0§.visible = false;
         this.§1t5700s0§.stop();
         this.§1t5708s0§();
         this.button.§1t5769s0§(§1t1521s0§.getString(242));
         this.button.visible = true;
         this.rank.text = "";
         this.rankpanel.visible = false;
      }
      
      public function §1t5710s0§() : *
      {
         visible = true;
         this.§1t5703s0§.text = §1t1521s0§.getString(280);
         this.playerLevel.text = §1t1521s0§.getString(241) + ": " + §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§);
         this.§1t5698s0§.visible = false;
         this.§1t5700s0§.visible = false;
         this.§1t5700s0§.stop();
         this.§1t5708s0§();
         this.inviteText.text = "";
         this.rank.textColor = 16763904;
         this.button.visible = false;
         this.§1t5701s0§.visible = true;
         if(this.§1t5705s0§.isFacebook)
         {
            this.§1t5720s0§();
            this.§1t5187s0§.visible = false;
         }
         else
         {
            this.§1t5187s0§.visible = true;
            this.§1t5187s0§.§1t5491s0§(§1t1523s0§.§1t9732s0§());
            this.§1t5187s0§.x = 22.5;
         }
      }
      
      public function §1t5711s0§() : Boolean
      {
         return this.§1t5703s0§.text == §1t1521s0§.getString(280);
      }
      
      internal function §1t5712s0§() : *
      {
         if(this.§1t5705s0§.isFacebook)
         {
            if(this.§1t5705s0§.charname == §1t1523s0§.charname)
            {
               this.§1t5710s0§();
               return;
            }
            this.§1t5720s0§();
            this.§1t5703s0§.text = this.§1t5705s0§.username;
            this.§1t5698s0§.visible = false;
            this.§1t5187s0§.visible = false;
         }
         else
         {
            if(this.§1t5705s0§.charname == §1t1523s0§.charname)
            {
               this.§1t5710s0§();
               return;
            }
            this.§1t5703s0§.text = this.§1t5705s0§.charname;
            this.§1t5698s0§.visible = true;
            this.§1t5700s0§.visible = false;
            this.§1t5700s0§.stop();
            this.§1t5187s0§.visible = true;
            this.§1t5708s0§();
         }
         this.playerLevel.text = §1t1521s0§.getString(241) + ": " + this.§1t5705s0§.wins;
         this.§1t5187s0§.§1t5491s0§(this.§1t5705s0§.equipment);
         this.§1t5187s0§.x = 12.5;
         this.button.visible = true;
         this.§1t5701s0§.visible = false;
         this.§1t5703s0§.multiline = false;
         this.inviteText.text = "";
         this.rankpanel.visible = true;
         this.rank.textColor = 15658726;
      }
      
      internal function §1t5713s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.§1t5703s0§.text == "")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            if(§1t1523s0§.§1t9521s0§)
            {
               §1t1676s0§.instance.inviteFriend();
            }
            else if(§1t1523s0§.§1t9503s0§)
            {
               §1t3318s0§.instance.§1t3408s0§(§1t1521s0§.getString(244,[§1t3317s0§.instance.username]));
            }
            else
            {
               ExternalInterface.call("makeRequest",§1t1521s0§.getString(244,[§1t3317s0§.instance.username]));
            }
         }
         else if(§1t1540s0§.§1t9550s0§() && (!§1t1541s0§.§1t10100s0§() || §1t406s0§.instance.§1t6499s0§.visible) && !§1t406s0§.instance.§1t6501s0§.visible && §1t1525s0§.§1t9923s0§() != 8)
         {
            if(§1t406s0§.instance.§1t6499s0§.visible && §1t406s0§.instance.§1t6499s0§.§1t6742s0§ == this.§1t5705s0§.charname)
            {
               §1t406s0§.instance.§1t6499s0§.§1t5737s0§();
            }
            else
            {
               §1t406s0§.instance.§1t6499s0§.§1t6751s0§(this.§1t5705s0§);
            }
         }
      }
      
      internal function §1t5714s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
            param1.stopPropagation();
         }
         §1t406s0§.instance.§1t6500s0§.§1t5714s0§(this.§1t5705s0§.charname);
         if(§1t406s0§.instance.§1t6499s0§.visible && §1t406s0§.instance.§1t6499s0§.§1t6742s0§ == this.§1t5705s0§.charname)
         {
            §1t406s0§.instance.§1t6499s0§.§1t4235s0§();
         }
      }
      
      internal function §1t5715s0§() : *
      {
         var _loc4_:String = null;
         var _loc5_:§1t23s0§ = null;
         if(§1t1523s0§.§1t9503s0§)
         {
            _loc4_ = this.§1t5705s0§.charname;
            if(_loc4_ == §1t1523s0§.charname)
            {
               _loc5_ = new §1t23s0§(null,§1t1523s0§.charname,null,null,null,null);
               _loc5_.playerlevel = §1t1523s0§.getLevel();
               _loc5_.equipment = §1t1523s0§.§1t9732s0§();
               _loc5_.playerdan = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§);
               _loc5_.side = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9422s0§);
               _loc5_.location = §1t1523s0§.§1t2220s0§();
               _loc5_.online = true;
               _loc5_.wins = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§);
               _loc5_.fbid = §1t1523s0§.facebookid;
               this.§1t5717s0§(_loc5_);
            }
            else if(_loc4_ != null)
            {
               §1t3318s0§.instance.client.§1t729s0§.load("PlayerData",_loc4_,this.§1t5717s0§);
            }
            return;
         }
         var _loc1_:URLRequest = new URLRequest(§1t3317s0§.instance.server + "getfrienddata.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         if(this.§1t5705s0§.isFacebook)
         {
            _loc3_.username = this.§1t5705s0§.username;
         }
         else
         {
            _loc3_.charname = this.§1t5705s0§.charname;
         }
         _loc3_.magicnum = §1t3317s0§.instance.magicnum;
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t5716s0§);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t5718s0§);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t5716s0§(param1:Event) : void
      {
         var _loc4_:§1t139s0§ = null;
         var _loc5_:§1t398s0§ = null;
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(§1t3317s0§.instance.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               if(this.§1t5705s0§.isFacebook && _loc3_.username == this.§1t5705s0§.username || _loc3_.charname == this.§1t5705s0§.charname)
               {
                  this.§1t5705s0§.initData(_loc3_,§1t3317s0§.instance.§1t1847s0§());
                  this.§1t5712s0§();
               }
               else
               {
                  _loc4_ = parent as §1t139s0§;
                  _loc5_ = _loc4_.§1t5745s0§(_loc3_.charname);
                  if(_loc5_ != null)
                  {
                     _loc5_.initData(_loc3_,§1t3317s0§.instance.§1t1847s0§());
                  }
               }
               break;
            case "1":
            case "2":
               break;
            case "3":
               if(!this.§1t5705s0§.isFacebook)
               {
                  this.§1t5714s0§(null);
               }
         }
      }
      
      internal function §1t5717s0§(param1:§1t23s0§) : *
      {
         var _loc2_:§1t139s0§ = null;
         var _loc3_:§1t398s0§ = null;
         if(param1 == null || param1.equipment == null)
         {
            if(!this.§1t5705s0§.isFacebook)
            {
               this.§1t5714s0§(null);
            }
            else if(param1 != null)
            {
               param1.equipment = "";
            }
            return;
         }
         if(param1.key == this.§1t5705s0§.charname)
         {
            this.§1t5705s0§.initDataPIO(param1,§1t3317s0§.instance.§1t1847s0§());
            this.§1t5712s0§();
         }
         else
         {
            _loc2_ = parent as §1t139s0§;
            _loc3_ = _loc2_.§1t5745s0§(param1.key);
            if(_loc3_ != null)
            {
               _loc3_.initDataPIO(param1,§1t3317s0§.instance.§1t1847s0§());
            }
         }
      }
      
      internal function §1t5718s0§(param1:IOErrorEvent) : void
      {
      }
      
      internal function §1t5720s0§() : *
      {
         if(this.§1t5706s0§ != null && this.contains(this.§1t5706s0§))
         {
            removeChild(this.§1t5706s0§);
         }
         var _loc1_:URLRequest = new URLRequest("http://graph.facebook.com/" + this.§1t5705s0§.facebookID + "/picture");
         this.§1t5719s0§ = this.§1t5705s0§.facebookID;
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t5721s0§);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t5722s0§);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§1t5723s0§);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t5721s0§(param1:Event) : void
      {
         if(!this.§1t5719s0§ == this.§1t5705s0§.facebookID)
         {
            this.§1t5719s0§ = null;
            return;
         }
         this.§1t5719s0§ = null;
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:ByteArray = _loc2_.data;
         this.§1t5706s0§ = new Loader();
         this.§1t5706s0§.loadBytes(_loc3_);
         addChild(this.§1t5706s0§);
         this.§1t5706s0§.x = 27;
         this.§1t5706s0§.y = 35;
         this.§1t5700s0§.visible = false;
         this.§1t5700s0§.stop();
      }
      
      internal function §1t5722s0§(param1:IOErrorEvent) : void
      {
      }
      
      internal function §1t5723s0§(param1:SecurityErrorEvent) : void
      {
      }
   }
}

