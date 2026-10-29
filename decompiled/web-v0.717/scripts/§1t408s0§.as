package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.*;
   import flash.text.TextField;
   import playerio.§1t23s0§;
   import playerio.PlayerIOError;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1700")]
   public class §1t408s0§ extends MovieClip
   {
      
      public var §1t5566s0§:TextField;
      
      public var DTTimerShadow:TextField;
      
      public var button1:§1t404s0§;
      
      public var button2:§1t404s0§;
      
      public var button3:§1t404s0§;
      
      public var button4:§1t404s0§;
      
      public var button5:§1t404s0§;
      
      public var button6:§1t404s0§;
      
      public var §1t5567s0§:SimpleButton;
      
      public var msgBoard:§1t6310s0§;
      
      public var §1t5187s0§:§1t5488s0§;
      
      public var §1t6740s0§:MovieClip;
      
      public var §1t5703s0§:TextField;
      
      public var playerText:TextField;
      
      public var §1t5571s0§:TextField;
      
      public var §1t5572s0§:TextField;
      
      internal var §1t5877s0§:int;
      
      internal var buttons:Array = new Array();
      
      internal var actions:Vector.<§1t766s0§> = new Vector.<§1t766s0§>();
      
      internal var §1t5885s0§:§1t111s0§;
      
      internal var §1t6742s0§:String;
      
      internal var §1t6743s0§:int;
      
      internal var §1t6744s0§:int = 0;
      
      internal var §1t6745s0§:String;
      
      internal var §1t6746s0§:int;
      
      internal var §1t5878s0§:Number = §1t407s0§.instance.x + 10;
      
      internal var §1t5879s0§:Number = §1t407s0§.instance.y + 40;
      
      internal var §1t5880s0§:Number = §1t407s0§.instance.actionButtonHeight;
      
      internal var §1t5744s0§:Boolean = false;
      
      internal var §1t6747s0§:Boolean = false;
      
      internal var §1t6748s0§:Boolean = false;
      
      internal var §1t5705s0§:§1t398s0§;
      
      public function §1t408s0§()
      {
         super();
         this.button1.x = this.§1t5878s0§;
         this.button1.y = this.§1t5879s0§;
         this.buttons.push(this.button1);
         this.button2.x = this.§1t5878s0§;
         this.button2.y = this.§1t5879s0§ + this.§1t5880s0§;
         this.buttons.push(this.button2);
         this.button3.x = this.§1t5878s0§;
         this.button3.y = this.§1t5879s0§ + 2 * this.§1t5880s0§;
         this.buttons.push(this.button3);
         this.button4.x = this.§1t5878s0§;
         this.button4.y = this.§1t5879s0§ + 3 * this.§1t5880s0§;
         this.buttons.push(this.button4);
         this.button5.x = this.§1t5878s0§;
         this.button5.y = this.§1t5879s0§ + 4 * this.§1t5880s0§;
         this.buttons.push(this.button5);
         this.button6.x = this.§1t5878s0§;
         this.button6.y = this.§1t5879s0§ + 5 * this.§1t5880s0§;
         this.buttons.push(this.button6);
         §1t1521s0§.§1t9290s0§(this.§1t6740s0§.label,true);
         §1t1521s0§.§1t9290s0§(this.§1t5703s0§,true);
         §1t1521s0§.§1t9290s0§(this.playerText);
         §1t1521s0§.§1t9290s0§(this.§1t5572s0§,true);
         this.§1t5572s0§.text = §1t1521s0§.getString(59);
      }
      
      public function init(param1:String, param2:int, param3:String, param4:int) : *
      {
         var _loc5_:String = null;
         if(!§1t3317s0§.instance.§1t2019s0§())
         {
            §1t406s0§.instance.§1t6637s0§();
            return;
         }
         this.§1t5004s0§();
         this.visible = true;
         this.§1t6740s0§.label.text = §1t1521s0§.getString(201) + param1;
         this.§1t5703s0§.text = param1;
         this.§1t6742s0§ = param1;
         this.§1t6743s0§ = param2;
         this.§1t6746s0§ = param4;
         §1t406s0§.instance.§1t6590s0§(false);
         this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
         §1t6427s0§.§1t8196s0§(false);
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
         }
         if(§1t406s0§.instance.§1t6500s0§.§1t5735s0§)
         {
            this.§1t5744s0§ = §1t406s0§.instance.§1t6500s0§.§1t5744s0§(param1);
         }
         else
         {
            this.§1t5744s0§ = true;
         }
         this.playerText.text = §1t1521s0§.getString(90);
         this.§1t5885s0§ = §1t1524s0§.§1t9893s0§(§1t401s0§.§1t12364s0§);
         this.§1t5877s0§ = 0;
         if(!this.§1t6748s0§ && param1 != "[Event]" && param1 != "[Tournament]")
         {
            this.msgBoard.§1t5004s0§();
            if(this.§1t6747s0§)
            {
               this.msgBoard.init(§1t1521s0§.getString(887,[param1]),0,0,param1,§1t6310s0§.§1t12428s0§);
            }
            else if(this.§1t6755s0§())
            {
               this.msgBoard.init(§1t1521s0§.getString(887,[param1]),0,0,param1,§1t6310s0§.§1t12428s0§);
            }
            else
            {
               this.msgBoard.init(§1t1521s0§.getString(888),0,0,param1,§1t6310s0§.§1t12429s0§);
               §1t1523s0§.§1t9389s0§ = false;
               §1t406s0§.instance.§1t6648s0§();
            }
         }
         this.button1.visible = false;
         this.button2.visible = false;
         this.button3.visible = false;
         this.button4.visible = false;
         this.button5.visible = false;
         this.button6.visible = false;
         this.§1t5187s0§.visible = false;
         this.msgBoard.visible = false;
         if(this.§1t6748s0§)
         {
            this.§1t6753s0§(param1,param2,param3,0,0);
         }
         else if(param1 == "[Event]" || param1 == "[Tournament]")
         {
            this.msgBoard.visible = true;
            this.playerText.text = "";
            _loc5_ = "";
            if(param1 == "[Event]")
            {
               _loc5_ = §1t1521s0§.getString(995);
            }
            else if(param1 == "[Tournament]")
            {
               _loc5_ = §1t1521s0§.getString(996);
            }
            this.§1t6740s0§.label.text = _loc5_;
            this.§1t5703s0§.text = §1t1521s0§.getString(994);
            this.msgBoard.init(_loc5_,0,0,param1,§1t6310s0§.§1t12431s0§);
            §1t1523s0§.§1t9389s0§ = false;
            §1t406s0§.instance.§1t6648s0§();
            this.§1t5885s0§ = new §1t111s0§(XML("<ui><menu><option><label>232</label><icon>23</icon><action><id>close</id><param>0</param></action></option></menu></ui>"));
            this.§1t5887s0§();
         }
         else
         {
            this.§1t5715s0§();
         }
      }
      
      internal function §1t5887s0§(param1:§1t400s0§ = null) : *
      {
         var _loc7_:§1t766s0§ = null;
         this.actions.length = 0;
         if(param1 == null)
         {
            param1 = this.§1t5885s0§.§1t765s0§[this.§1t5877s0§];
         }
         var _loc2_:int = param1.§1t777s0§();
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < 6)
         {
            this.buttons[_loc5_].visible = false;
            _loc5_++;
         }
         var _loc6_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc7_ = param1.§1t776s0§[_loc5_];
            _loc4_ = §1t1523s0§.§1t640s0§(_loc7_.condition);
            if(_loc5_ < _loc2_ && _loc4_)
            {
               _loc6_ = _loc7_.ap;
               this.buttons[_loc3_].visible = true;
               if(_loc6_ == 0)
               {
                  this.buttons[_loc3_].§1t5769s0§(§1t1521s0§.getString(_loc7_.label));
               }
               else
               {
                  this.buttons[_loc3_].§1t5769s0§(§1t1521s0§.getString(_loc7_.label),"",_loc6_);
               }
               if(_loc7_.icon != -1)
               {
                  this.buttons[_loc3_].§1t5767s0§(_loc7_.icon);
               }
               else
               {
                  this.buttons[_loc3_].§1t5768s0§();
               }
               this.actions[_loc3_] = _loc7_;
               _loc3_++;
            }
            _loc5_++;
         }
      }
      
      internal function §1t5890s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         if(this.actions[param1].§1t775s0§() != "close")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         switch(this.actions[param1].§1t775s0§())
         {
            case "goto":
               this.§1t5877s0§ = this.actions[param1].§1t771s0§;
               this.§1t5887s0§();
               break;
            case "close":
               this.§1t5737s0§();
               break;
            case "challenge":
               if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
               }
               else if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§) > 0)
               {
                  _loc2_ = §1t1523s0§.getLevel();
                  if(Math.abs(this.§1t6743s0§ - _loc2_) <= 3)
                  {
                     this.§1t6749s0§();
                  }
                  else if(this.§1t6743s0§ > _loc2_ && this.§1t6747s0§)
                  {
                     §1t406s0§.instance.§1t5481s0§(§1t1521s0§.getString(766),this.§1t6749s0§,§1t406s0§.instance.§1t6486s0§.§1t5483s0§);
                  }
                  else
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(240),§1t1521s0§.getString(5));
                  }
               }
               else
               {
                  §1t406s0§.instance.§1t6529s0§();
               }
               break;
            case "duelreplay":
               §1t3317s0§.instance.§1t1952s0§(this.§1t6742s0§);
               break;
            case "addfriend":
               if(this.§1t5705s0§ != null)
               {
                  §1t406s0§.instance.§1t6500s0§.§1t5739s0§(this.§1t6742s0§,this.§1t5705s0§.wins);
               }
               this.§1t4235s0§();
               break;
            case "givecoins":
               if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
               }
               else if(§1t3317s0§.instance.§1t1536s0§())
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(991),§1t1521s0§.getString(5));
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               else
               {
                  §1t406s0§.instance.§1t6551s0§(this.§1t6748s0§);
               }
               break;
            case "giveitem":
               §1t406s0§.instance.§1t6546s0§(this.§1t6748s0§);
               this.visible = false;
               break;
            case "trade":
               if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9231s0§)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(860),§1t1521s0§.getString(5));
               }
               else if(§1t1523s0§.§1t9595s0§() >= §1t1523s0§.§1t9603s0§())
               {
                  §1t406s0§.instance.§1t6527s0§("You cannot trade when your inventory is full.",§1t1521s0§.getString(5));
               }
               else
               {
                  this.§1t6750s0§();
               }
               break;
            case "teachfire1":
               §1t251s0§.instance.§1t3534s0§(1,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10383s0§);
               this.§1t5737s0§();
               break;
            case "teachfire2":
               §1t251s0§.instance.§1t3534s0§(2,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10383s0§);
               this.§1t5737s0§();
               break;
            case "teachwater1":
               §1t251s0§.instance.§1t3534s0§(3,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10391s0§);
               this.§1t5737s0§();
               break;
            case "teachwater2":
               §1t251s0§.instance.§1t3534s0§(4,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10391s0§);
               this.§1t5737s0§();
               break;
            case "teachwind1":
               §1t251s0§.instance.§1t3534s0§(5,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10397s0§);
               this.§1t5737s0§();
               break;
            case "teachwind2":
               §1t251s0§.instance.§1t3534s0§(6,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10397s0§);
               this.§1t5737s0§();
               break;
            case "teachearth1":
               §1t251s0§.instance.§1t3534s0§(7,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10385s0§);
               this.§1t5737s0§();
               break;
            case "teachearth2":
               §1t251s0§.instance.§1t3534s0§(8,this.§1t6742s0§);
               §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10385s0§);
               this.§1t5737s0§();
         }
      }
      
      public function §1t6749s0§() : *
      {
         this.removeEventListeners();
         visible = false;
         §1t5565s0§.instance.§1t5589s0§();
         §1t5565s0§.instance.§1t5594s0§(this.§1t6742s0§,this.§1t6743s0§,this.§1t6745s0§);
         §1t1623s0§.instance.§1t1627s0§();
      }
      
      public function §1t6750s0§() : *
      {
         if(§1t1523s0§.§1t1981s0§ && !§1t1523s0§.§1t9519s0§)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(11081,[this.§1t6742s0§]),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else if(§1t3317s0§.instance.§1t1536s0§())
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(991),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
         else
         {
            §1t6477s0§.instance.show(this.§1t6742s0§);
            §1t1623s0§.instance.§1t1628s0§();
         }
      }
      
      public function §1t4235s0§() : *
      {
         this.init(this.§1t6742s0§,this.§1t6743s0§,this.§1t6745s0§,this.§1t6746s0§);
      }
      
      public function show(param1:String, param2:int, param3:String, param4:int, param5:Boolean) : *
      {
         if(visible && param1 == this.§1t6742s0§)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t6747s0§ = true;
         this.§1t5705s0§ = null;
         this.§1t6748s0§ = param5;
         this.init(param1,param2,param3,param4);
      }
      
      public function §1t5593s0§() : *
      {
         this.§1t5571s0§.text = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9416s0§).toString();
      }
      
      public function §1t6751s0§(param1:§1t398s0§) : *
      {
         if(visible && param1.charname == this.§1t6742s0§)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_mail");
         this.§1t6747s0§ = false;
         this.§1t5705s0§ = param1;
         this.§1t6748s0§ = false;
         this.init(param1.charname,int(param1.level),param1.equipment,param1.side);
      }
      
      public function §1t6752s0§(param1:String) : *
      {
         if(param1 == "")
         {
            return;
         }
         if(visible && param1 == this.§1t6742s0§)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_mail");
         this.§1t6747s0§ = false;
         this.§1t5705s0§ = null;
         this.§1t6748s0§ = false;
         this.init(param1,0,"",0);
      }
      
      internal function §1t6016s0§() : *
      {
         this.button1.§1t5769s0§(§1t1521s0§.getString(234));
         this.button1.§1t5767s0§(§1t407s0§.§1t12447s0§);
         this.button2.§1t5769s0§(§1t1521s0§.getString(235));
         this.button2.§1t5767s0§(§1t407s0§.§1t12450s0§);
         this.button3.§1t5769s0§(§1t1521s0§.getString(232));
         this.button3.§1t5767s0§(§1t407s0§.§1t12455s0§);
         this.button1.visible = true;
         this.button2.visible = true;
         this.button3.visible = true;
         this.button4.visible = false;
         this.button5.visible = false;
         this.§1t5877s0§ = 2;
      }
      
      public function §1t5737s0§() : *
      {
         if(!visible)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t1523s0§.§1t9586s0§().§1t4453s0§();
         §1t406s0§.instance.§1t6590s0§(true);
         §1t407s0§.instance.visible = true;
         §1t6427s0§.§1t8196s0§(true);
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10045s0§();
            §1t406s0§.instance.§1t6610s0§();
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.button1.addEventListener(MouseEvent.CLICK,this.§1t5893s0§);
         this.button2.addEventListener(MouseEvent.CLICK,this.§1t5894s0§);
         this.button3.addEventListener(MouseEvent.CLICK,this.§1t5895s0§);
         this.button4.addEventListener(MouseEvent.CLICK,this.§1t5896s0§);
         this.button5.addEventListener(MouseEvent.CLICK,this.§1t5897s0§);
         this.button6.addEventListener(MouseEvent.CLICK,this.§1t5898s0§);
         this.§1t5567s0§.addEventListener(MouseEvent.CLICK,this.§1t5615s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.button1.removeEventListener(MouseEvent.CLICK,this.§1t5893s0§);
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5894s0§);
         this.button3.removeEventListener(MouseEvent.CLICK,this.§1t5895s0§);
         this.button4.removeEventListener(MouseEvent.CLICK,this.§1t5896s0§);
         this.button5.removeEventListener(MouseEvent.CLICK,this.§1t5897s0§);
         this.button6.removeEventListener(MouseEvent.CLICK,this.§1t5898s0§);
         this.§1t5567s0§.removeEventListener(MouseEvent.CLICK,this.§1t5615s0§);
      }
      
      public function §1t6753s0§(param1:String, param2:int, param3:String, param4:int, param5:int) : *
      {
         var dantext:String = null;
         var charname:String = param1;
         var level:int = param2;
         var equipment:String = param3;
         var dan:int = param4;
         var side:int = param5;
         if(charname == §1t1523s0§.charname)
         {
            level = §1t1523s0§.getLevel();
            equipment = §1t1523s0§.§1t9732s0§();
            dan = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§);
            side = §1t1523s0§.§1t7746s0§();
         }
         this.§1t5703s0§.text = charname;
         switch(dan)
         {
            case 0:
               dantext = "";
               break;
            case 1:
               dantext = "(nidan)";
               break;
            case 2:
               dantext = "(sandan)";
               break;
            case 3:
               dantext = "(yondan) " + §1t1521s0§.getString(465);
               break;
            case 4:
               dantext = "(godan) " + §1t1521s0§.getString(465);
               break;
            case 5:
               dantext = "(rokudan) " + §1t1521s0§.getString(465);
               break;
            case 6:
               dantext = "(nanadan) " + §1t1521s0§.getString(466);
               break;
            case 7:
               dantext = "(hachidan) " + §1t1521s0§.getString(466);
               break;
            case 8:
               dantext = "(kyudan) " + §1t1521s0§.getString(467);
               break;
            case 9:
               dantext = "(judan) " + §1t1521s0§.getString(467);
               break;
            default:
               dantext = "(judan) " + §1t1521s0§.getString(467);
         }
         this.§1t5187s0§.visible = true;
         if(!this.§1t6748s0§)
         {
            this.msgBoard.visible = true;
         }
         this.§1t5887s0§();
         this.§1t5187s0§.§1t5491s0§(equipment);
         this.§1t5187s0§.§1t5492s0§();
         this.§1t6742s0§ = charname;
         this.§1t6743s0§ = level;
         this.§1t6744s0§ = dan;
         this.§1t6745s0§ = equipment;
         if(!this.§1t6748s0§)
         {
            this.playerText.text = §1t1521s0§.getString(155) + ": " + String(level) + " " + dantext;
         }
         else
         {
            this.playerText.text = "";
         }
         switch(side)
         {
            case 0:
               break;
            case 1:
               this.playerText.appendText("\n" + §1t1521s0§.getString(245) + ": " + §1t1521s0§.getString(275));
               break;
            case 2:
               this.playerText.appendText("\n" + §1t1521s0§.getString(245) + ": " + §1t1521s0§.getString(276));
               break;
            case 3:
               this.playerText.appendText("\n" + §1t1521s0§.getString(245) + ": " + §1t1521s0§.getString(277));
               break;
            case 4:
               this.playerText.appendText("\n" + §1t1521s0§.getString(245) + ": " + §1t1521s0§.getString(278));
               break;
            default:
               if(§1t1523s0§.§1t9663s0§(side))
               {
                  if(§1t3318s0§.instance.§1t3434s0§(side))
                  {
                     this.playerText.appendText("\n" + §1t1521s0§.getString(245) + ": " + §1t1521s0§.getString(563,[§1t3318s0§.instance.§1t3435s0§(side).clanname]));
                  }
                  else
                  {
                     §1t3318s0§.instance.§1t3432s0§(side,function():*
                     {
                        §1t4235s0§();
                     });
                  }
               }
         }
         if(this.§1t5705s0§ != null)
         {
            if(this.§1t5705s0§.bounty > 0)
            {
               this.playerText.appendText("\n" + §1t1521s0§.getString(246) + ": " + this.§1t5705s0§.bounty);
            }
            this.playerText.appendText("\n" + §1t1521s0§.getString(241) + ": " + this.§1t5705s0§.wins);
            if(this.§1t5705s0§.prevName != "")
            {
               this.playerText.appendText("\n" + §1t1521s0§.getString(992,[this.§1t5705s0§.prevName]));
            }
            if(this.§1t5705s0§.online)
            {
               this.playerText.appendText("\n" + §1t1521s0§.getString(202));
            }
         }
      }
      
      internal function §1t5893s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(0);
      }
      
      internal function §1t5894s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(1);
      }
      
      internal function §1t5895s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(2);
      }
      
      internal function §1t5896s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(3);
      }
      
      internal function §1t5897s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(4);
      }
      
      internal function §1t5898s0§(param1:MouseEvent) : *
      {
         this.§1t5890s0§(5);
      }
      
      internal function §1t5715s0§() : *
      {
         if(this.§1t5705s0§ != null && this.§1t5705s0§.isLoaded())
         {
            if(this.§1t5705s0§.equipment == null)
            {
               this.§1t5705s0§.equipment = §1t76s0§.§1t9212s0§;
            }
            this.§1t6753s0§(this.§1t5705s0§.charname,this.§1t5705s0§.level,this.§1t5705s0§.equipment,this.§1t5705s0§.dan,this.§1t5705s0§.side);
            return;
         }
         if(§1t1523s0§.§1t9503s0§)
         {
            §1t3318s0§.instance.client.§1t729s0§.load("PlayerData",this.§1t6742s0§,this.§1t5717s0§,this.§1t6754s0§);
            return;
         }
         var _loc1_:URLRequest = new URLRequest(§1t3317s0§.instance.server + "getfrienddata.php");
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.VARIABLES;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_.charname = this.§1t6742s0§;
         _loc3_.magicnum = §1t3317s0§.instance.magicnum;
         _loc1_.data = _loc3_;
         _loc1_.method = URLRequestMethod.POST;
         _loc2_.addEventListener(Event.COMPLETE,this.§1t5716s0§);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§1t5718s0§);
         _loc2_.load(_loc1_);
      }
      
      internal function §1t5716s0§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         if(§1t3317s0§.instance.debug)
         {
         }
         switch(_loc3_.status)
         {
            case "0":
               if(_loc3_.charname == this.§1t6742s0§)
               {
                  if(this.§1t5705s0§ == null)
                  {
                     this.§1t5705s0§ = new §1t398s0§(_loc3_.charname);
                  }
                  this.§1t5705s0§.initData(_loc3_,§1t3317s0§.instance.§1t1847s0§());
                  this.§1t6753s0§(_loc3_.charname,_loc3_.lvl,_loc3_.eq,_loc3_.dan,_loc3_.side);
                  if(_loc3_.lastping < 300)
                  {
                     this.playerText.appendText("\n\n" + §1t1521s0§.getString(202));
                  }
               }
               break;
            case "1":
            case "2":
         }
      }
      
      internal function §1t5717s0§(param1:§1t23s0§) : *
      {
         if(param1 == null)
         {
            this.§1t5737s0§();
            return;
         }
         if(param1.key == this.§1t6742s0§)
         {
            if(this.§1t5705s0§ == null)
            {
               this.§1t5705s0§ = new §1t398s0§(param1.key);
            }
            if(param1.equipment == null)
            {
               param1.equipment = §1t76s0§.§1t9212s0§;
            }
            this.§1t5705s0§.initDataPIO(param1,§1t3317s0§.instance.§1t1847s0§());
            this.§1t6753s0§(param1.key,param1.playerlevel,param1.equipment,param1.playerdan,param1.side);
         }
      }
      
      internal function §1t5718s0§(param1:IOErrorEvent) : void
      {
      }
      
      internal function §1t6754s0§(param1:PlayerIOError) : void
      {
      }
      
      public function §1t5615s0§(param1:MouseEvent) : *
      {
         this.§1t5737s0§();
         §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12360s0§);
      }
      
      public function §1t6755s0§() : Boolean
      {
         return this.§1t6742s0§ != §1t1523s0§.charname;
      }
      
      public function §1t6756s0§() : Boolean
      {
         return !this.§1t6748s0§;
      }
   }
}

