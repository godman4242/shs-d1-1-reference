package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1960")]
   public class §1t7445s0§ extends MovieClip
   {
      
      public var border:MovieClip;
      
      public var canvas:§1t5016s0§;
      
      public var §1t7447s0§:RedBG;
      
      public var §1t7448s0§:TextField;
      
      public var §1t7280s0§:TextField;
      
      internal var roomType:int;
      
      internal var bg:MovieClip;
      
      internal var §1t7449s0§:MovieClip;
      
      internal var §1t7450s0§:§1t26s0§;
      
      internal var §1t7451s0§:Boolean = false;
      
      public function §1t7445s0§()
      {
         super();
         stop();
         buttonMode = true;
         mouseChildren = false;
         this.border.gotoAndStop(1);
         hitArea = this.§1t7447s0§;
         this.§1t7447s0§.visible = false;
      }
      
      public function §1t1755s0§(param1:§1t26s0§, param2:§1t24s0§) : *
      {
         var _loc5_:int = 0;
         this.§1t7450s0§ = param1;
         this.roomType = param1.id;
         if(this.bg == null)
         {
            this.bg = §1t1522s0§.§1t9322s0§("TowerRoomBuildImage");
            this.canvas.addChild(this.bg);
            this.bg.stop();
            this.§1t7449s0§ = new §1t7520s0§();
            this.§1t7449s0§.x = 30;
            this.§1t7449s0§.y = -19;
            this.canvas.addChild(this.§1t7449s0§);
         }
         this.bg.gotoAndStop(param1.bg + 1);
         this.§1t7449s0§.gotoAndStop(param1.§1t968s0§);
         this.§1t7449s0§.visible = param1.§1t968s0§ != -1;
         var _loc3_:* = "#FFFFFF";
         if(param2.§1t577s0§() < param1.towerreq || param2.§1t579s0§(§1t24s0§.§1t8747s0§) < param1.§1t959s0§)
         {
            _loc3_ = "#666666";
            this.§1t7449s0§.gotoAndStop("locked");
            this.§1t7449s0§.visible = true;
         }
         this.§1t7280s0§.htmlText = "<font color=\'" + _loc3_ + "\'>" + param1.§1t509s0§() + "</font>";
         this.§1t7451s0§ = false;
         var _loc4_:int = param1.§1t965s0§;
         if(_loc4_ != -1)
         {
            _loc5_ = param2.§1t627s0§(this.roomType);
            if(_loc5_ >= _loc4_)
            {
               this.§1t7448s0§.htmlText = "<font color=\'#CCCCCC\'>" + _loc5_ + "/" + _loc4_ + "</font>";
               this.§1t7451s0§ = true;
            }
            else
            {
               this.§1t7448s0§.htmlText = "<font color=\'#CCCCCC\'>" + _loc5_ + "/" + _loc4_ + "</font>";
            }
            this.§1t7448s0§.visible = true;
         }
         else
         {
            this.§1t7448s0§.visible = false;
         }
         if(this.roomType == §1t24s0§.§1t8767s0§ && param2.§1t577s0§() < 2)
         {
            this.bg.gotoAndStop("hutworkshop");
         }
      }
      
      public function §1t7452s0§(param1:int) : *
      {
         var _loc2_:String = null;
         this.roomType = param1;
         if(this.bg == null)
         {
            this.bg = §1t1522s0§.§1t9322s0§("TowerRoomBuildImage");
            this.canvas.addChild(this.bg);
            this.bg.stop();
            this.§1t7449s0§ = new §1t7520s0§();
            this.§1t7449s0§.x = 30;
            this.§1t7449s0§.y = -19;
            this.canvas.addChild(this.§1t7449s0§);
         }
         this.§1t7449s0§.visible = false;
         this.§1t7448s0§.visible = false;
         this.§1t7451s0§ = false;
         var _loc3_:String = "#FFFFFF";
         if(param1 == §1t24s0§.§1t8771s0§)
         {
            _loc2_ = §1t1521s0§.getString(22006);
            this.bg.gotoAndStop(11 + §1t412s0§.instance.§1t916s0§.§1t577s0§());
         }
         else if(param1 == §1t24s0§.§1t8773s0§)
         {
            _loc2_ = §1t1521s0§.getString(22011);
            this.bg.gotoAndStop("addstorey");
         }
         else if(param1 == §1t24s0§.§1t8774s0§)
         {
            _loc2_ = §1t1521s0§.getString(22013);
            this.bg.gotoAndStop("addbasement");
         }
         this.§1t7280s0§.htmlText = "<font color=\'" + _loc3_ + "\'>" + _loc2_ + "</font>";
      }
      
      public function setSelected(param1:Boolean) : *
      {
         if(param1)
         {
            this.border.gotoAndStop(2);
         }
         else
         {
            this.border.gotoAndStop(1);
         }
      }
   }
}

