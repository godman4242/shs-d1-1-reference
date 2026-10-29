package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2075")]
   public class §1t7198s0§ extends MovieClip
   {
      
      public var coin:MovieClip;
      
      public var §1t6212s0§:TextField;
      
      public var §1t7199s0§:TextField;
      
      public var §1t7200s0§:§1t5050s0§;
      
      public var gold:MovieClip;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var info:MovieClip;
      
      public var §1t6881s0§:SimpleButton;
      
      public var §1t6791s0§:TextField;
      
      public var §1t7201s0§:TextField;
      
      public var §1t7202s0§:§1t5059s0§;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t6823s0§:Array;
      
      internal const §1t7203s0§:int = 5;
      
      internal var §1t7204s0§:int = -1;
      
      internal var §1t7205s0§:§1t6782s0§ = null;
      
      internal var §1t6810s0§:int;
      
      public function §1t7198s0§()
      {
         var _loc1_:§1t6782s0§ = null;
         super();
         this.§1t6823s0§ = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t7203s0§)
         {
            _loc1_ = new §1t6782s0§(_loc2_);
            _loc1_.x = 60;
            _loc1_.y = 76 + _loc2_ * 70;
            this.§1t6823s0§.push(_loc1_);
            addChild(_loc1_);
            _loc2_++;
         }
      }
      
      public function init(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
         this.§1t7200s0§.§1t5769s0§(§1t1521s0§.getString(22039));
         this.§1t7202s0§.§1t5769s0§(§1t1521s0§.getString(22040));
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
         this.§1t5021s0§.text = §1t1521s0§.getString(22041);
         this.§1t7201s0§.text = §1t1521s0§.getString(22043);
         this.§1t6791s0§.text = §1t1521s0§.getString(22044);
      }
      
      public function show() : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t7204s0§ = -1;
         this.§1t7206s0§();
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
      }
      
      internal function §1t7206s0§() : *
      {
         var _loc1_:§1t6782s0§ = null;
         var _loc3_:§1t29s0§ = null;
         var _loc2_:int = int(this.§1t916s0§.§1t555s0§.length);
         if(_loc2_ == 5)
         {
            this.§1t7199s0§.text = §1t1521s0§.getString(22038);
            this.§1t6791s0§.visible = true;
         }
         else
         {
            this.§1t7199s0§.text = §1t1521s0§.getString(22037,[_loc2_ + "/5"]);
            this.§1t6791s0§.visible = false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.§1t7203s0§)
         {
            _loc1_ = this.§1t6823s0§[_loc4_];
            if(_loc4_ >= _loc2_)
            {
               _loc1_.visible = false;
            }
            else
            {
               _loc3_ = this.§1t916s0§.§1t555s0§[_loc4_];
               _loc1_.§1t6784s0§(_loc3_.charname);
               _loc1_.visible = true;
            }
            _loc4_++;
         }
         if(_loc2_ > 0)
         {
            this.§1t7209s0§(0);
            this.§1t7201s0§.visible = false;
         }
         else
         {
            this.info.visible = false;
            this.§1t7202s0§.visible = false;
            this.§1t7200s0§.visible = false;
            this.gold.visible = false;
            this.§1t5054s0§.visible = false;
            this.coin.visible = false;
            this.§1t6212s0§.visible = false;
            this.§1t6791s0§.visible = false;
            this.§1t7201s0§.visible = true;
         }
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
      }
      
      public function hide() : *
      {
         if(this.§1t7205s0§ != null)
         {
            this.§1t7205s0§.§1t6786s0§(false);
         }
         this.§1t7205s0§ = null;
         this.removeEventListeners();
         visible = false;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t6881s0§.addEventListener(MouseEvent.CLICK,this.§1t7207s0§);
         this.§1t7202s0§.addEventListener(MouseEvent.CLICK,this.§1t7211s0§);
         this.§1t7200s0§.addEventListener(MouseEvent.CLICK,this.§1t7212s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7203s0§)
         {
            this.§1t6823s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t7208s0§);
            _loc1_++;
         }
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t6881s0§.removeEventListener(MouseEvent.CLICK,this.§1t7207s0§);
         this.§1t7202s0§.removeEventListener(MouseEvent.CLICK,this.§1t7211s0§);
         this.§1t7200s0§.removeEventListener(MouseEvent.CLICK,this.§1t7212s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7203s0§)
         {
            this.§1t6823s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t7208s0§);
            _loc1_++;
         }
      }
      
      internal function §1t7207s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.hide();
      }
      
      internal function §1t7208s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t7205s0§ != null)
         {
            this.§1t7205s0§.§1t6786s0§(false);
         }
         this.§1t7205s0§ = §1t6782s0§(param1.currentTarget);
         this.§1t7205s0§.§1t6786s0§(true);
         this.§1t7209s0§(this.§1t7205s0§.index);
      }
      
      internal function §1t7209s0§(param1:int) : *
      {
         var _loc2_:§1t29s0§ = null;
         this.§1t7204s0§ = param1;
         _loc2_ = this.§1t916s0§.§1t555s0§[this.§1t7204s0§];
         this.info.§1t7280s0§.text = _loc2_.charname;
         this.info.§1t5438s0§.§1t5491s0§(_loc2_.mcs.§1t1251s0§());
         this.info.§1t5438s0§.scaleX = 2;
         this.info.§1t5438s0§.scaleY = 2;
         this.info.§1t5438s0§.visible = true;
         var _loc3_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8755s0§);
         this.info.§1t6959s0§.text = §1t1521s0§.getString(22036,[_loc3_]);
         this.info.rankText.text = _loc2_.§1t7210s0§();
         var _loc4_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8756s0§);
         var _loc5_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8757s0§);
         var _loc6_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8758s0§);
         var _loc7_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8759s0§);
         var _loc8_:int = _loc2_.§1t7323s0§(§1t24s0§.§1t8760s0§);
         var _loc9_:int = §1t29s0§.§1t12495s0§;
         this.info.§1t7374s0§.scaleY = _loc4_ / _loc9_;
         this.info.§1t7370s0§.scaleY = _loc5_ / _loc9_;
         this.info.§1t7379s0§.scaleY = _loc6_ / _loc9_;
         this.info.§1t7389s0§.scaleY = _loc7_ / _loc9_;
         this.info.§1t7384s0§.scaleY = _loc8_ / _loc9_;
         this.info.§1t16396s0§.visible = _loc4_ == _loc9_;
         this.info.§1t16397s0§.visible = _loc5_ == _loc9_;
         this.info.§1t16398s0§.visible = _loc6_ == _loc9_;
         this.info.§1t16399s0§.visible = _loc7_ == _loc9_;
         this.info.§1t16400s0§.visible = _loc8_ == _loc9_;
         this.info.§1t7376s0§.text = this.§1t7210s0§(_loc4_);
         this.info.§1t7372s0§.text = this.§1t7210s0§(_loc5_);
         this.info.§1t7381s0§.text = this.§1t7210s0§(_loc6_);
         this.info.§1t7391s0§.text = this.§1t7210s0§(_loc7_);
         this.info.§1t7386s0§.text = this.§1t7210s0§(_loc8_);
         this.info.visible = true;
         this.§1t7202s0§.visible = true;
         this.gold.visible = true;
         this.§1t5054s0§.visible = true;
         if(_loc2_.§1t7322s0§())
         {
            this.§1t7200s0§.visible = true;
            this.coin.visible = true;
            this.§1t6212s0§.visible = true;
         }
         else
         {
            this.§1t7200s0§.visible = false;
            this.coin.visible = false;
            this.§1t6212s0§.visible = false;
         }
      }
      
      internal function §1t7210s0§(param1:int) : String
      {
         if(param1 == 0)
         {
            return "E";
         }
         if(param1 == 1)
         {
            return "E+";
         }
         if(param1 == 2)
         {
            return "D";
         }
         if(param1 == 3)
         {
            return "D+";
         }
         if(param1 == 4)
         {
            return "C";
         }
         if(param1 == 5)
         {
            return "C+";
         }
         if(param1 == 6)
         {
            return "B";
         }
         if(param1 == 7)
         {
            return "B+";
         }
         if(param1 == 8)
         {
            return "A";
         }
         if(param1 == 9)
         {
            return "A+";
         }
         if(param1 == 10)
         {
            return "S";
         }
         return "E";
      }
      
      internal function §1t7211s0§(param1:MouseEvent) : *
      {
         var event:MouseEvent = param1;
         this.§1t6810s0§ = §1t1523s0§.§1t9613s0§();
         §1t1523s0§.§1t9615s0§(5,function():*
         {
            §1t916s0§.§1t626s0§(§1t7204s0§);
            §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
            §1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
            if(§1t916s0§.§1t555s0§.length == 0)
            {
               hide();
               §1t412s0§.instance.§1t7626s0§(false);
            }
            else
            {
               hide();
            }
            var _loc1_:§1t413s0§ = new §1t413s0§(null);
            _loc1_.§1t995s0§(§1t24s0§.§1t8747s0§,1);
            §1t412s0§.instance.§1t7616s0§(null,§1t412s0§.instance.§1t7058s0§,§1t412s0§.instance.§1t7059s0§,_loc1_);
            if(§1t6810s0§ <= §1t1523s0§.§1t9613s0§())
            {
               §1t3318s0§.instance.§1t3409s0§(§1t6810s0§ + " " + §1t1523s0§.§1t9613s0§() + " " + §1t1521s0§.getString(22040));
            }
         },function():*
         {
            §1t406s0§.instance.§1t6552s0§(5);
         });
      }
      
      internal function §1t7212s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = this.§1t7213s0§();
         if(this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8748s0§) > _loc2_)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            this.§1t916s0§.§1t580s0§(§1t24s0§.§1t8748s0§,-_loc2_);
            this.§1t916s0§.§1t625s0§(this.§1t7204s0§);
            this.§1t7200s0§.visible = false;
            this.coin.visible = false;
            this.§1t6212s0§.visible = false;
            this.hide();
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t7213s0§() : int
      {
         var _loc1_:§1t29s0§ = this.§1t916s0§.§1t555s0§[this.§1t7204s0§];
         return _loc1_.§1t7323s0§(§1t24s0§.§1t8755s0§) * 100;
      }
      
      public function destroy() : *
      {
         this.§1t916s0§ = null;
         this.§1t7205s0§ = null;
      }
      
      public function §1t6899s0§() : *
      {
         this.§1t5057s0§.text = §1t1523s0§.§1t9613s0§().toString();
      }
   }
}

