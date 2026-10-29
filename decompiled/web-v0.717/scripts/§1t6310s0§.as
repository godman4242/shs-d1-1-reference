package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.SoftKeyboardEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol540")]
   public class §1t6310s0§ extends MovieClip
   {
      
      internal static var §1t12427s0§:int = 0;
      
      internal static var §1t12428s0§:int = 1;
      
      internal static var §1t12429s0§:int = 2;
      
      internal static var §1t12430s0§:int = 3;
      
      internal static var §1t12431s0§:int = 4;
      
      public var messageboardlabel:TextField;
      
      public var msgtext:TextField;
      
      public var postallbutton:§1t5050s0§;
      
      public var postsidebutton:§1t5050s0§;
      
      public var refreshbutton:SimpleButton;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var words:TextField;
      
      internal var §1t1838s0§:int = 0;
      
      internal var mapid:int = 0;
      
      internal var side:int = 0;
      
      internal var charname:String = "";
      
      internal var §1t6316s0§:Boolean = false;
      
      internal var §1t6317s0§:int = 0;
      
      internal var §1t6318s0§:int;
      
      internal var §1t6319s0§:Boolean = false;
      
      internal var §1t5234s0§:String = "";
      
      public function §1t6310s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.messageboardlabel,true);
         §1t1521s0§.§1t9290s0§(this.msgtext);
         this.postallbutton.§1t5769s0§(§1t1521s0§.getString(386));
         this.words.condenseWhite = true;
      }
      
      public function init(param1:String, param2:int, param3:int, param4:String = "", param5:int = 0) : *
      {
         this.messageboardlabel.text = param1;
         this.words.text = §1t1521s0§.getString(318);
         this.msgtext.htmlText = §1t1521s0§.getString(90);
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
         this.§1t1838s0§ = §1t3317s0§.instance.§1t1847s0§();
         this.side = param3;
         this.charname = param4;
         this.§1t6317s0§ = param5;
         if(this.§1t6317s0§ == §1t12427s0§)
         {
            this.mapid = -1;
         }
         else
         {
            this.mapid = param2;
         }
         this.words.visible = true;
         this.postsidebutton.visible = true;
         this.msgtext.height = 210;
         this.§1t5019s0§.y = 225;
         this.§1t6318s0§ = 12;
         var _loc6_:* = true;
         if(this.§1t6317s0§ == §1t12430s0§)
         {
            _loc6_ = false;
         }
         if(this.§1t6317s0§ == §1t12430s0§ || this.§1t6317s0§ == §1t12427s0§)
         {
            this.postsidebutton.§1t5769s0§(§1t1521s0§.getString(316));
            §1t3317s0§.instance.§1t1906s0§(this.mapid,this.side);
         }
         else if(this.§1t6317s0§ == §1t12428s0§)
         {
            this.postsidebutton.§1t5769s0§(§1t1521s0§.getString(885));
            §1t3317s0§.instance.§1t2023s0§(this.charname,§1t1523s0§.charname);
         }
         else if(this.§1t6317s0§ == §1t12429s0§)
         {
            this.postsidebutton.visible = false;
            this.words.visible = false;
            this.msgtext.height = 260;
            this.§1t5019s0§.y = 270;
            this.§1t6318s0§ = 15;
            §1t3317s0§.instance.§1t2024s0§();
         }
         else if(this.§1t6317s0§ == §1t12431s0§)
         {
            this.postsidebutton.visible = false;
            this.words.visible = false;
            this.msgtext.height = 260;
            this.§1t5019s0§.y = 270;
            this.§1t6318s0§ = 15;
            §1t3317s0§.instance.§1t2023s0§(this.charname,§1t1523s0§.charname);
         }
         if(_loc6_)
         {
            this.postsidebutton.x = 79;
            this.postallbutton.visible = false;
         }
         else
         {
            this.postsidebutton.x = 10;
            this.postallbutton.visible = true;
         }
      }
      
      public function §1t5735s0§() : Boolean
      {
         return this.§1t1838s0§ != 0;
      }
      
      public function §1t5004s0§() : *
      {
         if(this.§1t6319s0§)
         {
            return;
         }
         this.§1t6319s0§ = true;
         this.postsidebutton.addEventListener(MouseEvent.CLICK,this.§1t6323s0§);
         if(!this.§1t6316s0§)
         {
            this.postallbutton.addEventListener(MouseEvent.CLICK,this.§1t6322s0§);
         }
         this.refreshbutton.addEventListener(MouseEvent.CLICK,this.§1t6329s0§);
         this.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         this.words.addEventListener(MouseEvent.CLICK,this.§1t6328s0§);
         this.msgtext.addEventListener(TextEvent.LINK,§1t406s0§.instance.§1t6609s0§);
         this.words.addEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         if(§1t1523s0§.§1t9528s0§)
         {
            this.words.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATING,this.§1t6325s0§);
            this.words.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.§1t6326s0§);
         }
         else
         {
            this.msgtext.addEventListener(Event.SCROLL,this.§1t6324s0§);
         }
      }
      
      public function removeEventListeners() : *
      {
         this.§1t6319s0§ = false;
         this.postsidebutton.removeEventListener(MouseEvent.CLICK,this.§1t6323s0§);
         if(!this.§1t6316s0§)
         {
            this.postallbutton.removeEventListener(MouseEvent.CLICK,this.§1t6322s0§);
         }
         this.refreshbutton.removeEventListener(MouseEvent.CLICK,this.§1t6329s0§);
         this.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         this.words.removeEventListener(MouseEvent.CLICK,this.§1t6328s0§);
         this.msgtext.removeEventListener(TextEvent.LINK,§1t406s0§.instance.§1t6609s0§);
         this.words.removeEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         if(§1t1523s0§.§1t9528s0§)
         {
            this.words.removeEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATING,this.§1t6325s0§);
            this.words.removeEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,this.§1t6326s0§);
         }
         else
         {
            this.msgtext.removeEventListener(Event.SCROLL,this.§1t6324s0§);
         }
      }
      
      public function §1t6320s0§(param1:Array) : *
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc7_:§1t23s0§ = null;
         var _loc6_:String = "";
         var _loc8_:int = §1t1523s0§.§1t7746s0§();
         var _loc9_:* = int(param1.length - 1);
         while(_loc9_ >= 0)
         {
            _loc7_ = param1[_loc9_];
            _loc3_ = "<font color=\'#333333\'>";
            if(_loc7_.side != null)
            {
               if(_loc7_.side == 1)
               {
                  _loc3_ = "<font color=\'#990000\'>";
               }
               else if(_loc7_.side == 2)
               {
                  _loc3_ = "<font color=\'#006600\'>";
               }
               else if(_loc7_.side == 3)
               {
                  _loc3_ = "<font color=\'#000099\'>";
               }
               else if(_loc7_.side == 4)
               {
                  _loc3_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(_loc7_.side))
               {
                  if(_loc7_.side == §1t1523s0§.§1t7746s0§())
                  {
                     _loc3_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                  }
                  else
                  {
                     _loc3_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                  }
               }
               if(_loc7_.charname != "[d]")
               {
                  _loc6_ += _loc3_ + _loc7_.charname + ":  </font>" + _loc7_.msg + "<font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ")</font><br>";
               }
               else
               {
                  _loc2_ = _loc7_.msg.split(",");
                  _loc4_ = "<font color=\'#333333\'>";
                  if(_loc2_[4] == 1)
                  {
                     _loc4_ = "<font color=\'#990000\'>";
                  }
                  else if(_loc2_[4] == 2)
                  {
                     _loc4_ = "<font color=\'#006600\'>";
                  }
                  else if(_loc2_[4] == 3)
                  {
                     _loc4_ = "<font color=\'#000099\'>";
                  }
                  else if(_loc2_[4] == 4)
                  {
                     _loc4_ = "<font color=\'#85762E\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc2_[4]))
                  {
                     if(_loc2_[4] == _loc8_)
                     {
                        _loc4_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                     }
                     else
                     {
                        _loc4_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                     }
                  }
                  _loc5_ = "<font color=\'#333333\'>";
                  if(_loc2_[5] == 1)
                  {
                     _loc5_ = "<font color=\'#990000\'>";
                  }
                  else if(_loc2_[5] == 2)
                  {
                     _loc5_ = "<font color=\'#006600\'>";
                  }
                  else if(_loc2_[5] == 3)
                  {
                     _loc5_ = "<font color=\'#000099\'>";
                  }
                  else if(_loc2_[5] == 4)
                  {
                     _loc5_ = "<font color=\'#85762E\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc2_[5]))
                  {
                     if(_loc2_[5] == _loc8_)
                     {
                        _loc5_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                     }
                     else
                     {
                        _loc5_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                     }
                  }
                  _loc6_ += "<font color=\'#333333\'>(" + _loc2_[0] + "," + _loc2_[1] + "):</font> " + _loc4_ + _loc2_[2] + "</font><font color=\'#333333\'>" + §1t1521s0§.getString(354) + "</font>" + _loc5_ + _loc2_[3] + "</font><font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ")</font><br>";
               }
            }
            else
            {
               if(this.§1t6317s0§ == §1t12428s0§ && _loc7_.charname != §1t1523s0§.charname)
               {
                  _loc6_ += "<font color=\'#7C6F2C\'>" + _loc7_.charname + ":  " + _loc7_.msg + "</font><font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ")</font><br>";
               }
               else
               {
                  _loc6_ += "<font color=\'#333333\'>" + _loc7_.charname + ":  " + _loc7_.msg + "</font><font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ")</font><br>";
               }
               if(this.§1t6317s0§ == §1t12431s0§)
               {
                  _loc6_ += "<br>";
               }
            }
            _loc9_--;
         }
         this.msgtext.htmlText = _loc6_;
         this.msgtext.scrollV = this.msgtext.maxScrollV;
         this.§1t6327s0§();
         this.§1t1838s0§ = §1t3317s0§.instance.§1t1847s0§();
      }
      
      public function §1t6321s0§(param1:Array) : *
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc7_:§1t23s0§ = null;
         var _loc8_:String = null;
         var _loc6_:String = "";
         var _loc9_:* = int(param1.length - 1);
         while(_loc9_ >= 0)
         {
            _loc7_ = param1[_loc9_];
            if(_loc7_.read == null || !_loc7_.read)
            {
               _loc6_ += "<font color=\'#7C6F2C\'><u><a href=\'event:[CHR]" + _loc7_.charname + "\'>" + _loc7_.charname + "</a></u>:  </font><font color=\'#333333\'>" + _loc7_.msg + "</font><font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ") - " + §1t1521s0§.getString(900) + " -</font><br>";
            }
            else
            {
               _loc6_ += "<font color=\'#7C6F2C\'><u><a href=\'event:[CHR]" + _loc7_.charname + "\'>" + _loc7_.charname + "</a></u>:  </font><font color=\'#666666\'>" + _loc7_.msg + "</font><font color=\'#666666\'> (" + this.§1t6331s0§(_loc7_.created) + ")</font><br>";
            }
            _loc9_--;
         }
         _loc6_ += "<br>" + §1t1521s0§.getString(899);
         this.msgtext.htmlText = _loc6_;
         this.msgtext.scrollV = this.msgtext.maxScrollV;
         this.§1t6327s0§();
         this.§1t1838s0§ = §1t3317s0§.instance.§1t1847s0§();
         this.§1t6327s0§();
      }
      
      internal function §1t6322s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = null;
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(param1 != null)
         {
            param1.stopPropagation();
         }
         if(this.words.text != §1t1521s0§.getString(318) && this.words.text != "")
         {
            _loc2_ = this.words.text.split("|").join("");
            _loc2_ = _loc2_.split("\"").join("\'");
            _loc2_ = _loc2_.split("\r").join("");
            _loc2_ = §1t406s0§.instance.§1t5322s0§(_loc2_);
            if(_loc2_ == this.§1t5234s0§)
            {
               this.words.text = "";
               return;
            }
            this.§1t5234s0§ = _loc2_;
            if(_loc2_ != "")
            {
               this.msgtext.htmlText += "<font color=\'#333333\'>" + §1t1523s0§.charname + ":  </font><font color=\'#333333\'>" + _loc2_ + "</font><font color=\'#666666\'> (" + §1t1521s0§.getString(897) + ")</font><br>";
               §1t3317s0§.instance.§1t1909s0§(this.mapid,0,§1t1523s0§.§1t7746s0§(),§1t1523s0§.charname,_loc2_);
               this.msgtext.scrollV = this.msgtext.maxScrollV;
               this.§1t6327s0§();
            }
         }
         this.words.text = "";
      }
      
      internal function §1t6323s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(param1 != null)
         {
            param1.stopPropagation();
         }
         if(this.§1t6317s0§ == §1t12428s0§)
         {
            if(this.words.text != §1t1521s0§.getString(318) && this.words.text != "")
            {
               _loc2_ = this.words.text.split("|").join("");
               _loc2_ = _loc2_.split("\"").join("\'");
               _loc2_ = _loc2_.split("\r").join("");
               _loc2_ = §1t406s0§.instance.§1t5322s0§(_loc2_);
               if(_loc2_ == this.§1t5234s0§)
               {
                  this.words.text = "";
                  return;
               }
               this.§1t5234s0§ = _loc2_;
               if(_loc2_ != "")
               {
                  this.msgtext.htmlText += "<font color=\'#333333\'>" + §1t1523s0§.charname + "</font>:  <font color=\'#333333\'>" + _loc2_ + "</font><font color=\'#666666\'> (" + §1t1521s0§.getString(897) + ")</font><br>";
                  §1t251s0§.instance.§1t3551s0§(this.charname,_loc2_);
                  this.msgtext.scrollV = this.msgtext.maxScrollV;
                  this.§1t6327s0§();
               }
            }
            this.words.text = "";
         }
         else
         {
            if(this.words.text != §1t1521s0§.getString(318) && this.words.text != "")
            {
               _loc2_ = this.words.text.split("|").join("");
               _loc2_ = _loc2_.split("\"").join("\'");
               _loc2_ = _loc2_.split("\r").join("");
               _loc2_ = §1t406s0§.instance.§1t5322s0§(_loc2_);
               if(_loc2_ == this.§1t5234s0§)
               {
                  this.words.text = "";
                  return;
               }
               this.§1t5234s0§ = _loc2_;
               if(_loc2_ != "")
               {
                  _loc3_ = "<font color=\'#333333\'>";
                  _loc4_ = §1t1523s0§.§1t7746s0§();
                  if(_loc4_ == 1)
                  {
                     _loc3_ = "<font color=\'#990000\'>";
                  }
                  else if(_loc4_ == 2)
                  {
                     _loc3_ = "<font color=\'#006600\'>";
                  }
                  else if(_loc4_ == 3)
                  {
                     _loc3_ = "<font color=\'#000099\'>";
                  }
                  else if(_loc4_ == 4)
                  {
                     _loc3_ = "<font color=\'#85762E\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc4_))
                  {
                     _loc3_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                  }
                  this.msgtext.htmlText += _loc3_ + §1t1523s0§.charname + ":  </font><font color=\'#333333\'>" + _loc2_ + "</font><font color=\'#666666\'>(" + §1t1521s0§.getString(897) + ")</font><br>";
                  §1t3317s0§.instance.§1t1909s0§(this.mapid,_loc4_,_loc4_,§1t1523s0§.charname,_loc2_);
                  this.msgtext.scrollV = this.msgtext.maxScrollV;
                  this.§1t6327s0§();
               }
            }
            this.words.text = "";
         }
      }
      
      internal function §1t5251s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         param1.stopPropagation();
         --this.msgtext.scrollV;
         this.§1t6327s0§();
      }
      
      internal function §1t5252s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         param1.stopPropagation();
         ++this.msgtext.scrollV;
         this.§1t6327s0§();
      }
      
      internal function §1t6324s0§(param1:Event) : *
      {
         this.§1t6327s0§();
      }
      
      internal function §1t6325s0§(param1:Event) : *
      {
         if(this.§1t6317s0§ == §1t12428s0§)
         {
            this.msgtext.height = 122;
            this.words.y = 158;
            this.msgtext.scrollV = this.msgtext.numLines - 7;
            this.postsidebutton.y = 193;
            this.postallbutton.y = 193;
         }
         else
         {
            this.msgtext.height = 87;
            this.words.y = 125;
            this.msgtext.scrollV = this.msgtext.numLines - 5;
            this.postsidebutton.y = 160;
            this.postallbutton.y = 160;
         }
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
      }
      
      internal function §1t6326s0§(param1:Event) : *
      {
         this.msgtext.height = 210;
         this.words.y = 248;
         this.§1t6327s0§();
         this.msgtext.scrollV = this.msgtext.maxScrollV;
         this.postsidebutton.y = 283;
         this.postallbutton.y = 283;
      }
      
      internal function §1t5233s0§(param1:KeyboardEvent) : *
      {
         param1.stopImmediatePropagation();
         if(this.words.text == "" || this.words.text == "\r")
         {
            return;
         }
         if(param1.keyCode == 13)
         {
            if(this.§1t6317s0§ == §1t12430s0§)
            {
               this.§1t6323s0§(null);
            }
            else if(this.postallbutton.visible)
            {
               this.§1t6322s0§(null);
            }
            else
            {
               this.§1t6323s0§(null);
            }
         }
      }
      
      internal function §1t6327s0§() : *
      {
         this.§1t5019s0§.visible = false;
         this.§1t5020s0§.visible = false;
         if(this.msgtext.numLines <= this.msgtext.maxScrollV)
         {
            return;
         }
         if(this.msgtext.scrollV < this.msgtext.maxScrollV)
         {
            this.§1t5019s0§.visible = true;
         }
         if(this.msgtext.scrollV > 1)
         {
            this.§1t5020s0§.visible = true;
         }
      }
      
      internal function §1t6328s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.words.text == §1t1521s0§.getString(318))
         {
            this.words.text = "";
         }
      }
      
      internal function §1t6329s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         param1.stopPropagation();
         if(§1t3317s0§.instance.§1t1847s0§() - this.§1t1838s0§ > 5)
         {
            this.§1t4235s0§();
         }
      }
      
      public function §1t6330s0§(param1:int) : *
      {
         if(§1t3317s0§.instance.§1t1847s0§() - this.§1t1838s0§ > param1)
         {
            this.§1t4235s0§();
         }
      }
      
      internal function §1t4235s0§() : *
      {
         if(this.§1t6317s0§ == §1t12430s0§ || this.§1t6317s0§ == §1t12427s0§)
         {
            §1t3317s0§.instance.§1t1906s0§(this.mapid,this.side);
         }
         else if(this.§1t6317s0§ == §1t12428s0§ || this.§1t6317s0§ == §1t12431s0§)
         {
            §1t3317s0§.instance.§1t2023s0§(this.charname,§1t1523s0§.charname);
         }
         else if(this.§1t6317s0§ == §1t12429s0§)
         {
            §1t3317s0§.instance.§1t2024s0§();
         }
      }
      
      internal function §1t6331s0§(param1:int) : String
      {
         var _loc4_:String = null;
         var _loc2_:int = §1t3317s0§.instance.§1t1847s0§();
         var _loc3_:int = _loc2_ - param1;
         if(_loc3_ < 60)
         {
            if(_loc3_ == 1)
            {
               return §1t1521s0§.getString(889,[_loc3_.toString()]);
            }
            return §1t1521s0§.getString(890,[_loc3_.toString()]);
         }
         _loc3_ = Math.floor(_loc3_ / 60);
         if(_loc3_ < 60)
         {
            if(_loc3_ == 1)
            {
               return §1t1521s0§.getString(891,[_loc3_.toString()]);
            }
            return §1t1521s0§.getString(892,[_loc3_.toString()]);
         }
         _loc3_ = Math.floor(_loc3_ / 60);
         if(_loc3_ < 24)
         {
            if(_loc3_ == 1)
            {
               return §1t1521s0§.getString(893,[_loc3_.toString()]);
            }
            return §1t1521s0§.getString(894,[_loc3_.toString()]);
         }
         _loc3_ = Math.floor(_loc3_ / 24);
         if(_loc3_ == 1)
         {
            return §1t1521s0§.getString(895,[_loc3_.toString()]);
         }
         return §1t1521s0§.getString(896,[_loc3_.toString()]);
      }
      
      public function §1t6332s0§(param1:String) : *
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc10_:int = 0;
         var _loc2_:Array = param1.split(String.fromCharCode(30));
         var _loc8_:String = "";
         var _loc9_:int = 0;
         while(_loc9_ < _loc2_.length)
         {
            if(_loc2_[_loc9_] != "")
            {
               _loc3_ = _loc2_[_loc9_].split(String.fromCharCode(31));
               _loc5_ = "<font color=\'#333333\'>";
               if(_loc3_[2] == 1)
               {
                  _loc5_ = "<font color=\'#990000\'>";
               }
               else if(_loc3_[2] == 2)
               {
                  _loc5_ = "<font color=\'#006600\'>";
               }
               else if(_loc3_[2] == 3)
               {
                  _loc5_ = "<font color=\'#000099\'>";
               }
               else if(_loc3_[2] == 4)
               {
                  _loc5_ = "<font color=\'#85762E\'>";
               }
               else if(§1t1523s0§.§1t9663s0§(_loc4_[2]))
               {
                  _loc10_ = §1t1523s0§.§1t7746s0§();
                  if(_loc10_ == _loc4_[2])
                  {
                     _loc5_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                  }
                  else
                  {
                     _loc5_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                  }
               }
               if(_loc3_[0] != "[d]")
               {
                  _loc8_ += _loc5_ + _loc3_[0] + ": </font><font color=\'#333333\'>" + _loc3_[1] + "</font><br>";
               }
               else
               {
                  _loc4_ = _loc3_[1].split(",");
                  _loc6_ = "<font color=\'#333333\'>";
                  if(_loc4_[4] == 1)
                  {
                     _loc6_ = "<font color=\'#990000\'>";
                  }
                  else if(_loc4_[4] == 2)
                  {
                     _loc6_ = "<font color=\'#006600\'>";
                  }
                  else if(_loc4_[4] == 3)
                  {
                     _loc6_ = "<font color=\'#000099\'>";
                  }
                  else if(_loc4_[4] == 4)
                  {
                     _loc6_ = "<font color=\'#85762E\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc4_[4]))
                  {
                     if(_loc10_ == _loc4_[4])
                     {
                        _loc6_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                     }
                     else
                     {
                        _loc6_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                     }
                  }
                  _loc7_ = "<font color=\'#333333\'>";
                  if(_loc4_[5] == 1)
                  {
                     _loc7_ = "<font color=\'#990000\'>";
                  }
                  else if(_loc4_[5] == 2)
                  {
                     _loc7_ = "<font color=\'#006600\'>";
                  }
                  else if(_loc4_[5] == 3)
                  {
                     _loc7_ = "<font color=\'#000099\'>";
                  }
                  else if(_loc4_[5] == 4)
                  {
                     _loc7_ = "<font color=\'#85762E\'>";
                  }
                  else if(§1t1523s0§.§1t9663s0§(_loc4_[5]))
                  {
                     if(_loc10_ == _loc4_[5])
                     {
                        _loc7_ = "<font color=\'" + §1t1523s0§.§1t9657s0§() + "\'>";
                     }
                     else
                     {
                        _loc7_ = "<font color=\'" + §1t1523s0§.§1t9662s0§() + "\'>";
                     }
                  }
                  _loc8_ += "<font color=\'#333333\'>(" + _loc4_[0] + "," + _loc4_[1] + "):</font> " + _loc6_ + _loc4_[2] + "</font><font color=\'#333333\'>" + §1t1521s0§.getString(354) + "</font>" + _loc7_ + _loc4_[3] + "</font><br>";
               }
            }
            _loc9_++;
         }
         this.msgtext.htmlText = _loc8_;
         if(this.msgtext.numLines > 12)
         {
            this.msgtext.scrollV = this.msgtext.maxScrollV;
            this.§1t5020s0§.visible = true;
            this.§1t5019s0§.visible = true;
         }
      }
   }
}

