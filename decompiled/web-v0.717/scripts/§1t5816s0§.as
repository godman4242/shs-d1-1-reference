package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1207")]
   public class §1t5816s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var §1t5817s0§:TextField;
      
      public var titleText:TextField;
      
      internal var §1t5819s0§:Vector.<§1t57s0§> = new Vector.<§1t57s0§>();
      
      internal var §1t5820s0§:Boolean = false;
      
      internal var §1t5478s0§:Boolean = false;
      
      internal var §1t5821s0§:String = "";
      
      public function §1t5816s0§()
      {
         super();
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         §1t1521s0§.§1t9290s0§(this.titleText,true);
         §1t1521s0§.§1t9290s0§(this.§1t5817s0§,false);
      }
      
      public function show() : *
      {
         var _loc2_:§1t57s0§ = null;
         if(!this.§1t5824s0§())
         {
            this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
            this.button.removeEventListeners();
            this.visible = false;
            return;
         }
         this.button.§1t5769s0§(§1t1521s0§.getString(5));
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         this.visible = true;
         this.titleText.text = §1t1521s0§.getString(288);
         var _loc1_:int = int(this.§1t5819s0§.length);
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = this.§1t5819s0§[_loc4_];
            _loc3_ += this.§1t5822s0§(_loc2_.§1t760s0§());
            _loc3_ += "<font color=\'#CCCCCC\'>";
            if(_loc2_.§1t761s0§() > 0 && _loc2_.§1t760s0§() != 50006)
            {
               _loc3_ += "+";
            }
            _loc3_ += _loc2_.§1t761s0§() + "</font><br>";
            _loc4_++;
         }
         _loc3_ += this.§1t5821s0§;
         this.§1t5817s0§.htmlText = _loc3_;
         this.§1t5825s0§();
         §1t406s0§.instance.§1t6613s0§();
      }
      
      internal function §1t5822s0§(param1:int) : String
      {
         switch(param1)
         {
            case 50000:
               return "<font color=\'#FF0000\'>" + §1t1521s0§.getString(289) + ":  </font>";
            case 50001:
               return "<font color=\'#00FF00\'>" + §1t1521s0§.getString(290) + ":  </font>";
            case 50002:
               return "<font color=\'#00FFFF\'>" + §1t1521s0§.getString(291) + ":  </font>";
            case 50003:
               return "<font color=\'#FFFF00\'>" + §1t1521s0§.getString(292) + ":  </font>";
            case 50004:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(638) + ":  </font>";
            case 50005:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(303) + ":  </font>";
            case 50006:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(352) + ":  </font>";
            case 50007:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(454) + ":  </font>";
            case 50008:
            case 50009:
            case 50010:
            case 50011:
            case 50012:
               break;
            case 50013:
               return "<font color=\'#FF0000\'>" + §1t1521s0§.getString(502) + ":  </font>";
            case 50014:
               return "<font color=\'#00FF00\'>" + §1t1521s0§.getString(503) + ":  </font>";
            case 50015:
               return "<font color=\'#00FFFF\'>" + §1t1521s0§.getString(504) + ":  </font>";
            case 50016:
               return "<font color=\'#FFFF00\'>" + §1t1521s0§.getString(505) + ":  </font>";
            case 50017:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(506) + ":  </font>";
            case 50018:
               return "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>" + §1t1521s0§.getString(812) + ":  </font>";
            case 50019:
            case 50020:
               return "<font color=\'#FFFFFF\'>" + §1t1521s0§.getString(638) + ":  </font>";
         }
         return "?";
      }
      
      public function §1t5484s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
         this.visible = false;
         if(§1t406s0§.instance.§1t6488s0§.visible)
         {
            return;
         }
         if(§1t406s0§.instance.§1t6482s0§.visible)
         {
            return;
         }
         if(!this.§1t5478s0§)
         {
            if(§1t1540s0§.§1t9550s0§())
            {
               §1t406s0§.instance.§1t6610s0§();
               §1t1541s0§.§1t10045s0§();
               if(!this.§1t5820s0§)
               {
                  §1t1525s0§.§1t9933s0§();
               }
            }
            else if(§1t1540s0§.§1t10014s0§())
            {
               §1t406s0§.instance.§1t6612s0§();
            }
            else
            {
               §1t1540s0§.§1t9895s0§();
            }
         }
         this.§1t5820s0§ = false;
         this.§1t5478s0§ = false;
      }
      
      public function §1t5823s0§(param1:int, param2:int) : *
      {
         this.§1t5819s0§.push(new §1t57s0§(param1,param2));
      }
      
      public function §1t5824s0§() : Boolean
      {
         return this.§1t5819s0§.length > 0;
      }
      
      public function §1t5825s0§() : *
      {
         this.§1t5819s0§.length = 0;
         this.§1t5821s0§ = "";
      }
      
      public function §1t5826s0§() : *
      {
         this.§1t5820s0§ = true;
      }
      
      public function §1t5486s0§() : *
      {
         this.§1t5478s0§ = true;
      }
      
      internal function §1t5827s0§(param1:int) : String
      {
         if(param1 == 0)
         {
            return "#FFFFFF";
         }
         if(param1 == 1)
         {
            return "#FF0000";
         }
         if(param1 == 2)
         {
            return "#00FF00";
         }
         if(param1 == 3)
         {
            return "#00FFFF";
         }
         if(param1 == 4)
         {
            return "#FFFF00";
         }
         if(param1 == 5)
         {
            return "#FFFFFF";
         }
         if(§1t1523s0§.§1t9663s0§(param1))
         {
            return §1t1523s0§.§1t9657s0§();
         }
         return "#FFFFFF";
      }
      
      public function §1t1961s0§(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         var _loc5_:§1t71s0§ = §1t70s0§.instance.§1t1126s0§(param3,param4,false);
         if(_loc5_.§1t1339s0§() == 0)
         {
            return false;
         }
         this.§1t5819s0§.push(new §1t57s0§(50007,param1));
         if(§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) <= 5 || param2 == 0)
         {
            return false;
         }
         if(param2 == 1)
         {
            this.§1t5819s0§.push(new §1t57s0§(50013,5));
         }
         else if(param2 == 2)
         {
            this.§1t5819s0§.push(new §1t57s0§(50014,5));
         }
         else if(param2 == 3)
         {
            this.§1t5819s0§.push(new §1t57s0§(50015,5));
         }
         else if(param2 == 4)
         {
            this.§1t5819s0§.push(new §1t57s0§(50016,5));
         }
         else if(param2 == 5)
         {
            this.§1t5819s0§.push(new §1t57s0§(50017,5));
         }
         else if(§1t1523s0§.§1t9663s0§(param2))
         {
            this.§1t5819s0§.push(new §1t57s0§(50018,5));
         }
         _loc5_.§1t1325s0§(param2,5);
         _loc5_.§1t1326s0§(5);
         return true;
      }
   }
}

