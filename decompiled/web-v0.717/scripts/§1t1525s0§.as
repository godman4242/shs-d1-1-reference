package
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.system.System;
   
   public class §1t1525s0§
   {
      
      internal static var §1t9899s0§:§1t112s0§;
      
      internal static var §1t9900s0§:int;
      
      internal static var player:§1t99s0§;
      
      internal static var action:int;
      
      internal static var §1t9904s0§:int;
      
      internal static var §1t9906s0§:§1t113s0§;
      
      internal static var §1t9907s0§:§1t5533s0§;
      
      internal static var §1t9908s0§:§1t5146s0§;
      
      internal static var actionState:int;
      
      internal static var timeCounter:int;
      
      internal static var §1t9548s0§:int;
      
      internal static var §1t9909s0§:int;
      
      internal static var §1t9910s0§:int;
      
      internal static var roomData:Array;
      
      internal static var §1t9911s0§:int;
      
      internal static var §1t9912s0§:int;
      
      internal static var §1t9913s0§:Point;
      
      internal static var §1t9549s0§:§1t406s0§;
      
      internal static var §1t9959s0§:Point;
      
      public static var §1t9901s0§:int = 0;
      
      public static var §1t9902s0§:int = 1;
      
      public static var §1t9903s0§:int = 2;
      
      internal static var §1t9905s0§:int = -1;
      
      internal static var §1t9914s0§:Vector.<String> = new Vector.<String>();
      
      internal static var §1t9915s0§:Vector.<int> = new Vector.<int>();
      
      internal static var §1t9949s0§:int = 350;
      
      internal static var §1t9950s0§:int = 450;
      
      internal static var §1t9956s0§:Boolean = false;
      
      internal static var §1t9957s0§:int = 0;
      
      internal static var §1t9958s0§:int = 0;
      
      public function §1t1525s0§()
      {
         super();
      }
      
      public static function §1t9916s0§(param1:int) : *
      {
         §1t9911s0§ = param1;
      }
      
      public static function §1t9917s0§(param1:int, param2:Stage, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : *
      {
         if(§1t9899s0§ != null)
         {
            §1t9937s0§();
         }
         switch(param3)
         {
            case §1t112s0§.§1t12548s0§:
               §1t9899s0§ = new §1t8455s0§(param3,param6,param4);
               break;
            case §1t112s0§.§1t12551s0§:
               §1t9899s0§ = new §1t8074s0§();
               break;
            case §1t112s0§.§1t12566s0§:
               §1t9899s0§ = new §1t8447s0§();
               break;
            case §1t112s0§.§1t12590s0§:
               §1t9899s0§ = new §1t8443s0§();
               break;
            case §1t112s0§.§1t12602s0§:
               §1t9899s0§ = new §1t8449s0§();
               break;
            case §1t112s0§.§1t12570s0§:
               §1t9899s0§ = new §1t8454s0§();
               break;
            case §1t112s0§.§1t12571s0§:
               §1t9899s0§ = new §1t8450s0§(1,param6);
               break;
            case §1t112s0§.§1t12572s0§:
               §1t9899s0§ = new §1t8450s0§(2,param6);
               break;
            default:
               §1t9899s0§ = new §1t8455s0§(param3,param6,param7);
         }
         param2.addChild(§1t9899s0§);
         §1t9899s0§.§1t5250s0§();
         action = param1;
         §1t9899s0§.§1t8123s0§(param4);
         §1t9900s0§ = param3;
         §1t9904s0§ = param5;
         if(§1t9906s0§ == null)
         {
            §1t9906s0§ = new §1t113s0§();
         }
         param2.addChild(§1t9906s0§);
         if(§1t9549s0§ == null)
         {
            §1t9549s0§ = §1t406s0§.§1t9190s0§();
         }
         param2.addChild(§1t9549s0§);
         §1t1540s0§.§1t10022s0§();
         if(action == §1t1540s0§.§1t10002s0§)
         {
            §1t9906s0§.visible = false;
            actionState = §1t9901s0§;
            §1t9549s0§.§1t6610s0§();
            §1t1541s0§.§1t10045s0§();
         }
         else
         {
            §1t9549s0§.§1t6611s0§();
            §1t9906s0§.init();
         }
         if(§1t9904s0§ > 0)
         {
            §1t9906s0§.§1t5212s0§(true);
            §1t9906s0§.§1t5213s0§(§1t9904s0§);
         }
         else
         {
            §1t9906s0§.§1t5212s0§(false);
         }
         if(action != §1t1540s0§.§1t10001s0§ && action != §1t1540s0§.§1t10002s0§)
         {
            if(§1t9908s0§ == null)
            {
               §1t9908s0§ = new §1t5146s0§();
            }
            §1t9908s0§.scaleX = §1t1523s0§.§1t9358s0§;
            §1t9908s0§.scaleY = §1t1523s0§.§1t9358s0§;
            §1t9908s0§.x = §1t1523s0§.§1t9359s0§;
            §1t9908s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
            param2.addChild(§1t9908s0§);
            §1t9908s0§.init(action);
            actionState = §1t9902s0§;
         }
         §1t9905s0§ = -1;
         timeCounter = 0;
         §1t9548s0§ = 0;
         player = §1t1523s0§.§1t9586s0§();
         §1t1541s0§.§1t9917s0§(param2);
         if(action == §1t1540s0§.§1t10007s0§ || §1t1540s0§.§1t9550s0§())
         {
            §1t1523s0§.§1t4443s0§();
            if(§1t1540s0§.§1t10047s0§() && !§1t251s0§.instance.§1t3612s0§() || §1t1540s0§.§1t10048s0§())
            {
               §1t1523s0§.§1t9586s0§().§1t4444s0§();
            }
         }
      }
      
      public static function §1t9918s0§(param1:int, param2:int, param3:int) : *
      {
         action = param1;
         §1t9899s0§.§1t8129s0§(0);
         §1t9899s0§.§1t8123s0§(param2);
         §1t9904s0§ = param3;
         §1t9549s0§.§1t6611s0§();
         §1t9906s0§.visible = true;
         §1t9906s0§.init();
         if(§1t9904s0§ > 0)
         {
            §1t9906s0§.§1t5212s0§(true);
            §1t9906s0§.§1t5213s0§(§1t9904s0§);
         }
         else
         {
            §1t9906s0§.§1t5212s0§(false);
         }
         var _loc4_:Stage = §1t1540s0§.§1t10025s0§();
         if(action != §1t1540s0§.§1t10001s0§ && action != §1t1540s0§.§1t10002s0§)
         {
            if(§1t9908s0§ == null)
            {
               §1t9908s0§ = new §1t5146s0§();
            }
            §1t9908s0§.scaleX = §1t1523s0§.§1t9358s0§;
            §1t9908s0§.scaleY = §1t1523s0§.§1t9358s0§;
            §1t9908s0§.x = §1t1523s0§.§1t9359s0§;
            §1t9908s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
            _loc4_.addChild(§1t9908s0§);
            §1t9908s0§.init(action);
            actionState = §1t9902s0§;
         }
         §1t9905s0§ = -1;
         timeCounter = 0;
         §1t9548s0§ = 0;
      }
      
      public static function §1t1014s0§(param1:Boolean) : *
      {
         if(§1t9907s0§ == null)
         {
            §1t9907s0§ = new §1t5533s0§();
         }
         §1t9907s0§.scaleX = §1t1523s0§.§1t9358s0§;
         §1t9907s0§.scaleY = §1t1523s0§.§1t9358s0§;
         §1t9907s0§.x = §1t1523s0§.§1t9359s0§;
         §1t9907s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
         §1t9907s0§.init(param1);
         var _loc2_:Stage = §1t1540s0§.§1t10025s0§();
         §1t8130s0§();
         _loc2_.addChild(§1t9907s0§);
         actionState = §1t9901s0§;
         §1t9905s0§ = -1;
         timeCounter = 0;
         §1t9548s0§ = 0;
         action = 6;
         §1t9549s0§.§1t6611s0§();
         §1t9906s0§.visible = true;
         §1t9906s0§.init();
         if(param1)
         {
            §1t9906s0§.§1t5247s0§(0);
         }
      }
      
      public static function §1t9919s0§(param1:Array, param2:int, param3:int) : *
      {
         roomData = param1;
         §1t9912s0§ = param2;
         §1t9914s0§.length = 0;
         §1t9915s0§.length = 0;
         §1t1523s0§.§1t9667s0§();
         §1t1523s0§.§1t9670s0§();
         if(roomData[0].§1t1382s0§() != "")
         {
            §1t407s0§.instance.§1t1182s0§(roomData[0].§1t1382s0§());
         }
         else
         {
            §1t407s0§.instance.§1t1182s0§(§1t1382s0§(0,§1t9911s0§));
         }
         if(param3 < §1t1523s0§.stageWidth / 2)
         {
            §1t9899s0§.§1t8129s0§(0);
         }
         else if(param3 >= roomData[param2].getWidth() - §1t1523s0§.stageWidth / 2)
         {
            §1t9899s0§.§1t8129s0§(roomData[param2].getWidth() - §1t1523s0§.stageWidth);
         }
         else if(param3 > §1t9899s0§.§1t8124s0§() - §1t1523s0§.stageWidth / 2)
         {
            §1t9899s0§.§1t8129s0§(§1t1523s0§.stageWidth - §1t9899s0§.§1t8124s0§());
         }
         §1t9899s0§.§1t8136s0§(roomData[param2].getObjectList(),§1t9914s0§);
         §1t9932s0§(§1t9911s0§,§1t9912s0§);
         §1t9899s0§.§1t8143s0§(player.§1t1559s0§());
         §1t88s0§.instance.§1t1504s0§(roomData[param2].getBG(),§1t9899s0§.§1t8115s0§,roomData[param2].isPvPRoom());
         §1t9924s0§(param3,false);
         §1t251s0§.§1t9190s0§().§1t3520s0§(§1t9911s0§,param2,roomData[param2].isPrivate,param3);
      }
      
      public static function §1t9920s0§(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:§1t71s0§ = null;
         var _loc2_:Point = §1t70s0§.instance.§1t1133s0§(param1);
         if(§1t9913s0§ == null || !§1t9913s0§.equals(_loc2_))
         {
            _loc3_ = _loc2_.x << 12 | _loc2_.y;
            _loc4_ = §1t70s0§.instance.§1t1127s0§(_loc3_);
            if(_loc4_ == null || !_loc4_.§1t1335s0§())
            {
               §1t3317s0§.instance.§1t1126s0§(_loc2_.x,_loc2_.y);
               return true;
            }
         }
         return false;
      }
      
      internal static function §1t9921s0§() : *
      {
         var _loc1_:Stage = §1t1540s0§.§1t10025s0§();
         if(§1t9906s0§ == null)
         {
            §1t9906s0§ = new §1t113s0§();
         }
         _loc1_.addChild(§1t9906s0§);
         if(§1t9549s0§ == null)
         {
            §1t9549s0§ = §1t406s0§.§1t9190s0§();
         }
         _loc1_.addChild(§1t9549s0§);
         §1t1540s0§.§1t10022s0§();
         §1t9906s0§.init();
         §1t1523s0§.§1t4443s0§();
         if(§1t9908s0§ == null)
         {
            §1t9908s0§ = new §1t5146s0§();
         }
         §1t9908s0§.scaleX = §1t1523s0§.§1t9358s0§;
         §1t9908s0§.scaleY = §1t1523s0§.§1t9358s0§;
         §1t9908s0§.x = §1t1523s0§.§1t9359s0§;
         §1t9908s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
         §1t1540s0§.§1t9973s0§.addChild(§1t9908s0§);
         if(§1t251s0§.instance.§1t3612s0§())
         {
            §1t9908s0§.init(1002);
         }
         else
         {
            §1t9908s0§.init(1000);
         }
         §1t406s0§.instance.§1t6643s0§("");
         §1t113s0§.instance.§1t5163s0§.§1t13358s0§.htmlText = §1t406s0§.instance.§1t5163s0§.§1t13358s0§.htmlText;
         §1t113s0§.instance.§1t5163s0§.§1t13358s0§.scrollV = §1t113s0§.instance.§1t5163s0§.§1t13358s0§.maxScrollV;
         §1t113s0§.instance.§1t5240s0§();
      }
      
      public static function §1t9922s0§(param1:int, param2:int = 150, param3:int = -1, param4:int = -1, param5:Boolean = false, param6:String = "") : *
      {
         var _loc8_:§1t134s0§ = null;
         var _loc11_:§1t72s0§ = null;
         var _loc12_:Point = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:§1t399s0§ = null;
         var _loc17_:§1t8587s0§ = null;
         var _loc18_:§1t8593s0§ = null;
         var _loc19_:int = 0;
         var _loc20_:Point = null;
         var _loc21_:Point = null;
         var _loc22_:int = 0;
         if(§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9586s0§().§1t3309s0§() <= 0)
         {
            return;
         }
         var _loc7_:Boolean = §1t251s0§.instance.§1t3612s0§();
         var _loc9_:int = §1t9911s0§;
         if(param1 == -1)
         {
            param1 = 0;
         }
         else if(param1 == -2 || param1 == -3)
         {
            param1 = 0;
            param3 = §1t1523s0§.§1t9714s0§(30021);
            if(param3 == 0)
            {
               param3 = §1t9911s0§;
            }
            §1t1523s0§.§1t9712s0§(30021,0);
            param2 = 150;
            if(param3 <= 0)
            {
               param3 = 8382465;
            }
            §1t1523s0§.§1t9763s0§(param3);
         }
         if(param1 == 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9436s0§) != 0)
         {
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9436s0§,0);
         }
         if(param6 != "" && param3 == -1)
         {
            param3 = §1t9935s0§();
         }
         if(param3 != -1)
         {
            _loc11_ = §1t1524s0§.§1t9886s0§(param3);
            if(_loc11_ != null)
            {
               _loc13_ = _loc11_.§1t1186s0§();
               if(_loc13_ != null)
               {
                  roomData = _loc13_;
                  if(param6 != "")
                  {
                     roomData[param1].§1t1383s0§(param6.substr(9));
                     if(param6.substr(0,12).toLowerCase() == "instance_pve")
                     {
                        roomData[param1].isPrivate = §1t134s0§.§1t9237s0§;
                     }
                     else
                     {
                        roomData[param1].isPrivate = §1t134s0§.§1t9233s0§;
                     }
                  }
                  if(roomData[param1].§1t1382s0§() != "")
                  {
                     §1t407s0§.instance.§1t1182s0§(roomData[param1].§1t1382s0§());
                  }
                  else
                  {
                     §1t407s0§.instance.§1t1182s0§(§1t1382s0§(param1,§1t9911s0§));
                  }
               }
            }
            _loc8_ = roomData[param1];
            if(roomData.length > 1 && (_loc8_.isPrivate != §1t134s0§.§1t9232s0§ && _loc8_.isPrivate != §1t134s0§.§1t9233s0§ && _loc8_.isPrivate != §1t134s0§.§1t9237s0§))
            {
               §1t1523s0§.§1t9763s0§(param3);
            }
            §1t9914s0§.length = 0;
            §1t9915s0§.length = 0;
            §1t1523s0§.§1t9667s0§();
            §1t1523s0§.§1t9670s0§();
            §1t6427s0§.§1t9916s0§(param3);
            §1t9911s0§ = param3;
            §1t1524s0§.§1t9866s0§(param3);
            _loc12_ = §1t70s0§.instance.§1t1133s0§(param3);
            if(§1t9913s0§ == null || !§1t9913s0§.equals(_loc12_))
            {
               §1t9913s0§ = _loc12_;
               §1t70s0§.instance.§1t1125s0§(param3);
            }
         }
         if(_loc8_ == null)
         {
            _loc8_ = roomData[param1];
         }
         §1t9912s0§ = param1;
         §1t9915s0§.push(param1);
         if(_loc8_ != null && _loc8_.§1t1382s0§() != "")
         {
            §1t407s0§.instance.§1t1182s0§(_loc8_.§1t1382s0§());
         }
         else
         {
            §1t407s0§.instance.§1t1182s0§(§1t1382s0§(param1,§1t9911s0§));
         }
         §1t1543s0§.§1t10242s0§(true);
         §1t1712s0§.§1t10242s0§();
         §1t9899s0§.§1t8137s0§();
         §1t9937s0§();
         var _loc10_:Boolean = false;
         if(_loc8_.isPvPRoom())
         {
            if(!§1t1540s0§.§1t10047s0§())
            {
               §1t1523s0§.§1t4431s0§ = false;
               §1t1540s0§.§1t10044s0§();
               §1t1524s0§.§1t9881s0§();
               §1t9917s0§(§1t1540s0§.§1t10007s0§,§1t1540s0§.§1t10025s0§(),_loc8_.getBG(),_loc8_.getWidth(),0,_loc8_.getBGParam(),_loc8_.getBGParam2());
               if(§1t9908s0§ == null)
               {
                  §1t9908s0§ = new §1t5146s0§();
               }
               §1t9908s0§.scaleX = §1t1523s0§.§1t9358s0§;
               §1t9908s0§.scaleY = §1t1523s0§.§1t9358s0§;
               §1t9908s0§.x = §1t1523s0§.§1t9359s0§;
               §1t9908s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
               §1t1540s0§.§1t9973s0§.addChild(§1t9908s0§);
               if(§1t251s0§.instance.§1t3612s0§())
               {
                  §1t9908s0§.init(1002);
               }
               else
               {
                  §1t9908s0§.init(1000);
               }
               §1t406s0§.instance.§1t6643s0§("");
               §1t113s0§.instance.§1t5163s0§.§1t13358s0§.htmlText = §1t406s0§.instance.§1t5163s0§.§1t13358s0§.htmlText;
               §1t113s0§.instance.§1t5163s0§.§1t13358s0§.scrollV = §1t113s0§.instance.§1t5163s0§.§1t13358s0§.maxScrollV;
               §1t113s0§.instance.§1t5240s0§();
               if(§1t3317s0§.instance.§1t1833s0§)
               {
                  §1t406s0§.instance.§1t6444s0§.x = 30;
                  §1t1525s0§.§1t9908s0§.§1t5150s0§();
               }
            }
            else
            {
               §1t1523s0§.§1t9582s0§();
               §1t9917s0§(§1t1540s0§.§1t10007s0§,§1t1540s0§.§1t10025s0§(),_loc8_.getBG(),_loc8_.getWidth(),0,_loc8_.getBGParam(),_loc8_.getBGParam2());
            }
         }
         else
         {
            §1t9917s0§(§1t1540s0§.§1t10002s0§,§1t1540s0§.§1t10025s0§(),_loc8_.getBG(),_loc8_.getWidth(),0,_loc8_.getBGParam(),_loc8_.getBGParam2());
            if(§1t1540s0§.§1t10047s0§())
            {
               _loc10_ = true;
               §1t1540s0§.§1t10045s0§();
               if(_loc8_.isPrivate == §1t134s0§.§1t9230s0§ && !_loc7_)
               {
                  §1t1523s0§.§1t4443s0§();
               }
               else
               {
                  §1t1523s0§.§1t9581s0§();
               }
               if(§1t9908s0§ == null)
               {
                  §1t9908s0§ = new §1t5146s0§();
               }
               §1t9908s0§.scaleX = §1t1523s0§.§1t9358s0§;
               §1t9908s0§.scaleY = §1t1523s0§.§1t9358s0§;
               §1t9908s0§.x = §1t1523s0§.§1t9359s0§;
               §1t9908s0§.y = (480 - 80) / 2 * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
               §1t1540s0§.§1t9973s0§.addChild(§1t9908s0§);
               if(_loc7_)
               {
                  §1t9908s0§.init(1003);
               }
               else
               {
                  §1t9908s0§.init(1001);
               }
               _loc14_ = §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9427s0§);
               if(_loc14_ != -1)
               {
                  §1t1523s0§.§1t9373s0§[_loc14_].§1t828s0§();
               }
               §1t113s0§.instance.§1t5240s0§();
               if(§1t3317s0§.instance.§1t1833s0§)
               {
                  §1t406s0§.instance.§1t6444s0§.x = -210;
               }
            }
         }
         §1t9899s0§.§1t8130s0§();
         §1t9899s0§.§1t8136s0§(_loc8_.getObjectList(),§1t9914s0§);
         §1t9932s0§(§1t9911s0§,§1t9912s0§);
         §1t88s0§.instance.§1t1504s0§(_loc8_.getBG(),§1t9899s0§.§1t8115s0§,_loc8_.isPvPRoom());
         if(param4 != -1)
         {
            _loc15_ = int(§1t9899s0§.§1t8119s0§.length);
            _loc19_ = 0;
            while(_loc19_ < _loc15_)
            {
               _loc16_ = §1t9899s0§.§1t8119s0§[_loc19_];
               if(_loc16_.typeid == 0)
               {
                  _loc17_ = _loc16_ as §1t8587s0§;
                  if(param4 == §1t70s0§.§1t9128s0§ && _loc17_.compassDir == §1t70s0§.§1t9129s0§ || param4 == §1t70s0§.§1t9129s0§ && _loc17_.compassDir == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§ && _loc17_.compassDir == §1t70s0§.§1t9131s0§ || param4 == §1t70s0§.§1t9131s0§ && _loc17_.compassDir == §1t70s0§.§1t9130s0§)
                  {
                     param2 = _loc17_.x;
                  }
               }
               else if(_loc16_.typeid == 22)
               {
                  _loc18_ = _loc16_ as §1t8593s0§;
                  if(param4 == §1t70s0§.§1t9128s0§ && _loc18_.compassDir == §1t70s0§.§1t9129s0§ || param4 == §1t70s0§.§1t9129s0§ && _loc18_.compassDir == §1t70s0§.§1t9128s0§ || param4 == §1t70s0§.§1t9130s0§ && _loc18_.compassDir == §1t70s0§.§1t9131s0§ || param4 == §1t70s0§.§1t9131s0§ && _loc18_.compassDir == §1t70s0§.§1t9130s0§)
                  {
                     param2 = _loc18_.x;
                  }
               }
               _loc19_++;
            }
         }
         if(param2 < §1t1523s0§.stageWidth / 2)
         {
            §1t9899s0§.§1t8129s0§(0);
            §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t5493s0§();
         }
         else if(param2 >= _loc8_.getWidth() - §1t1523s0§.stageWidth / 2)
         {
            §1t9899s0§.§1t8129s0§(§1t1523s0§.stageWidth - _loc8_.getWidth());
            §1t1543s0§.§1t2289s0§(_loc8_.getWidth() - §1t1523s0§.stageWidth);
            §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t5492s0§();
         }
         else
         {
            §1t9899s0§.§1t8129s0§(§1t1523s0§.stageWidth / 2 - param2);
            §1t1543s0§.§1t2289s0§(param2 - §1t1523s0§.stageWidth / 2);
         }
         §1t9924s0§(param2,param5);
         if(param1 == 0)
         {
            §1t406s0§.instance.§1t6633s0§(true);
            §1t406s0§.instance.§1t6456s0§.setNodeId(§1t9911s0§);
         }
         else
         {
            §1t406s0§.instance.§1t6633s0§(false);
            §1t402s0§.instance.§1t6343s0§(§1t9911s0§,param1,roomData);
         }
         if(_loc8_.isPvPRoom())
         {
            §1t411s0§.instance.y = 9.9;
            §1t402s0§.instance.y = 9.9;
            if(§1t1523s0§.§1t9672s0§())
            {
               §1t113s0§.instance.§1t5242s0§();
            }
            else
            {
               §1t406s0§.instance.§1t6592s0§();
            }
         }
         else
         {
            §1t411s0§.instance.y = 69.9;
            §1t402s0§.instance.y = 69.9;
         }
         §1t251s0§.§1t9190s0§().§1t3520s0§(§1t9911s0§,param1,_loc8_.isPrivate,param2,param6);
         if(_loc10_)
         {
            §1t1523s0§.§1t9582s0§();
            §1t406s0§.instance.§1t6583s0§(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9402s0§),§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§),§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9405s0§),§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9406s0§));
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t1541s0§.§1t10099s0§();
            §1t406s0§.instance.§1t6488s0§.show();
         }
         if(param3 != -1)
         {
            _loc20_ = §1t70s0§.instance.§1t1133s0§(_loc9_);
            _loc21_ = §1t70s0§.instance.§1t1133s0§(param3);
            if(!_loc20_.equals(_loc21_))
            {
               §1t1523s0§.§1t9763s0§(param3);
               if(param3 != §1t132s0§.§1t11336s0§)
               {
                  _loc22_ = §1t70s0§.instance.§1t1139s0§(param3) - §1t1523s0§.getLevel();
                  if(_loc22_ < -3)
                  {
                     §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(702),§1t1521s0§.getString(5));
                  }
                  else if(_loc22_ > 3 && param3 != 666)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(703),§1t1521s0§.getString(5));
                  }
               }
            }
         }
      }
      
      public static function §1t1382s0§(param1:int, param2:int) : String
      {
         var _loc3_:§1t72s0§ = null;
         var _loc4_:§1t134s0§ = null;
         if(param2 == -1)
         {
            if(param1 != -1)
            {
               _loc4_ = roomData[param1];
            }
            if(_loc4_ != null && _loc4_.§1t1382s0§() != "")
            {
               return _loc4_.§1t1382s0§();
            }
            _loc3_ = §1t1524s0§.§1t9886s0§(§1t9911s0§);
            return _loc3_.§1t1153s0§();
         }
         if(param1 == 0)
         {
            _loc3_ = §1t1524s0§.§1t9886s0§(param2);
            return _loc3_.§1t1153s0§();
         }
         _loc4_ = §1t1524s0§.§1t9886s0§(param2).§1t1186s0§()[param1];
         if(_loc4_ == null || _loc4_.§1t1382s0§() == "")
         {
            return §1t1524s0§.§1t9886s0§(param2).§1t1153s0§();
         }
         return _loc4_.§1t1382s0§();
      }
      
      public static function §1t9923s0§() : int
      {
         if(roomData[§1t9912s0§] == null)
         {
            return §1t134s0§.§1t9227s0§;
         }
         return roomData[§1t9912s0§].isPrivate;
      }
      
      internal static function §1t9924s0§(param1:int, param2:Boolean) : *
      {
         player.§1t1551s0§(§1t9899s0§.§1t8148s0§());
         if(!param2 && param1 <= 150)
         {
            player.setPosition(50,§1t4467s0§());
            player.§1t4452s0§(150);
         }
         else if(!param2 && param1 >= §1t9899s0§.§1t8124s0§() - 150)
         {
            player.setPosition(§1t9899s0§.§1t8124s0§() - 50,§1t4467s0§());
            player.§1t4452s0§(§1t9899s0§.§1t8124s0§() - 150);
         }
         else
         {
            player.setPosition(param1,§1t4467s0§());
            player.§1t4453s0§();
         }
      }
      
      public static function §1t9925s0§() : *
      {
         §1t9900s0§ = -1;
         §1t9922s0§(§1t9912s0§,§1t9909s0§,-1,-1,true);
         §1t9549s0§.§1t6578s0§();
         §1t1540s0§.§1t10022s0§();
      }
      
      public static function §1t9926s0§() : *
      {
         §1t9909s0§ = player.posX;
      }
      
      public static function §1t9927s0§(param1:String) : *
      {
         if(param1 != "")
         {
            §1t9914s0§.push(param1);
         }
      }
      
      public static function §1t9928s0§() : *
      {
         §1t9914s0§.pop();
      }
      
      public static function §1t9929s0§(param1:String) : Boolean
      {
         return §1t9914s0§.indexOf(param1) != -1;
      }
      
      public static function §1t9930s0§(param1:int) : Boolean
      {
         return §1t9915s0§.indexOf(param1) != -1;
      }
      
      public static function §1t9931s0§(param1:int) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:int = int(§1t9914s0§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = §1t9914s0§[_loc5_];
            _loc4_ = _loc3_.split("_");
            if(_loc4_.length == 3 && _loc4_[0] == "door" && _loc4_[1] == param1.toString())
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public static function §1t9932s0§(param1:int, param2:int) : *
      {
         var _loc5_:§1t107s0§ = null;
         var _loc6_:XMLList = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc12_:§1t60s0§ = null;
         var _loc13_:§1t69s0§ = null;
         var _loc14_:§1t76s0§ = null;
         var _loc15_:§1t76s0§ = null;
         var _loc3_:Vector.<§1t107s0§> = §1t1524s0§.§1t9867s0§();
         var _loc4_:int = int(_loc3_.length);
         var _loc9_:int = int(§1t9914s0§.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc10_];
            _loc6_ = _loc5_.§1t1111s0§();
            if(_loc6_ != null && _loc6_.room == param2)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc9_)
               {
                  if(_loc6_.name == §1t9914s0§[_loc8_])
                  {
                     return;
                  }
                  _loc8_++;
               }
               if(_loc6_.y.toString() == "")
               {
                  _loc7_ = §1t4467s0§();
               }
               else
               {
                  _loc7_ = int(_loc6_.y);
               }
               if(_loc6_.x == -1)
               {
                  _loc6_.x = Math.random() * §1t9899s0§.§1t8124s0§();
               }
               §1t9899s0§.§1t3537s0§(_loc6_.id,_loc6_.x,_loc7_,_loc6_.property,_loc6_.name,_loc5_);
            }
            _loc10_++;
         }
         _loc4_ = int(§1t1523s0§.§1t9373s0§.length);
         var _loc11_:int = §1t3317s0§.instance.§1t1848s0§();
         _loc10_ = 0;
         while(_loc10_ < _loc4_)
         {
            _loc12_ = §1t1523s0§.§1t9373s0§[_loc10_];
            if(_loc12_.§1t816s0§(param1,param2,_loc11_))
            {
               if(_loc12_.§1t823s0§())
               {
                  _loc13_ = §1t123s0§.instance.§1t1604s0§(_loc12_.nodeid,_loc12_.roomid,_loc12_.§1t802s0§,_loc12_.date,_loc12_.§1t807s0§,_loc12_.§1t808s0§,_loc12_.§1t810s0§,_loc12_.§1t809s0§);
                  _loc5_ = new §1t107s0§(_loc13_,_loc12_.step,3);
                  _loc5_.§1t1113s0§(_loc12_);
                  _loc6_ = _loc5_.§1t1111s0§();
                  if(_loc6_ != null)
                  {
                     _loc8_ = 0;
                     while(_loc8_ < _loc9_)
                     {
                        if(_loc6_.name == §1t9914s0§[_loc8_])
                        {
                           return;
                        }
                        _loc8_++;
                     }
                     if(_loc6_.y.toString() == "")
                     {
                        _loc7_ = §1t4467s0§();
                     }
                     else
                     {
                        _loc7_ = int(_loc6_.y);
                     }
                     if(_loc6_.x == -1)
                     {
                        _loc6_.x = Math.random() * §1t9899s0§.§1t8124s0§();
                     }
                     if(_loc12_.§1t807s0§ == §1t1799s0§.§1t11448s0§ || _loc12_.§1t807s0§ == §1t1799s0§.§1t11434s0§)
                     {
                        _loc14_ = §1t123s0§.instance.§1t1583s0§(_loc12_.nodeid,_loc12_.roomid,_loc12_.date);
                        §1t1524s0§.§1t9876s0§(_loc14_);
                     }
                     else if(_loc12_.§1t807s0§ == §1t1799s0§.§1t11445s0§)
                     {
                        _loc15_ = new §1t76s0§(null);
                        _loc15_.§1t1249s0§(_loc12_.nodeid,_loc12_.roomid,_loc12_.§1t802s0§,_loc12_.date,true);
                        §1t1524s0§.§1t9876s0§(_loc15_);
                        _loc15_.id = §1t76s0§.§1t9198s0§;
                        §1t1524s0§.§1t9876s0§(_loc15_);
                     }
                     §1t9899s0§.§1t3537s0§(_loc6_.id,_loc6_.x,_loc7_,_loc6_.property,_loc6_.name,_loc5_);
                  }
               }
            }
            _loc10_++;
         }
      }
      
      public static function §1t9933s0§() : *
      {
         §1t1543s0§.§1t10242s0§(false);
         §1t1712s0§.§1t10242s0§();
         §1t9899s0§.§1t8137s0§();
         §1t9899s0§.§1t8136s0§(roomData[§1t9912s0§].getObjectList(),§1t9914s0§);
         §1t9932s0§(§1t9911s0§,§1t9912s0§);
         §1t8143s0§(§1t1523s0§.§1t9586s0§().§1t1559s0§());
         §1t9899s0§.§1t8148s0§().addChild(§1t1523s0§.§1t9586s0§().§1t1559s0§());
         §1t88s0§.instance.§1t1504s0§(roomData[§1t9912s0§].getBG(),§1t9899s0§.§1t8115s0§,roomData[§1t9912s0§].isPvPRoom());
      }
      
      public static function §1t9934s0§() : *
      {
         §1t1543s0§.§1t10242s0§(true);
         §1t1712s0§.§1t10242s0§();
         if(§1t9899s0§ != null)
         {
            §1t9899s0§.§1t8137s0§();
         }
      }
      
      public static function §1t9935s0§() : int
      {
         return §1t9911s0§;
      }
      
      public static function §1t9936s0§() : int
      {
         return §1t70s0§.instance.§1t1139s0§(§1t9911s0§);
      }
      
      public static function §1t7341s0§() : int
      {
         return §1t9912s0§;
      }
      
      public static function §1t9937s0§() : *
      {
         §1t9934s0§();
         var _loc1_:Stage = §1t1540s0§.§1t10025s0§();
         if(§1t9899s0§ != null)
         {
            _loc1_.removeChild(§1t9899s0§);
         }
         §1t9899s0§ = null;
         if(§1t9906s0§ != null)
         {
            _loc1_.removeChild(§1t9906s0§);
         }
         if(§1t9907s0§ != null && _loc1_.contains(§1t9907s0§))
         {
            _loc1_.removeChild(§1t9907s0§);
         }
         if(§1t9908s0§ != null && _loc1_.contains(§1t9908s0§))
         {
            _loc1_.removeChild(§1t9908s0§);
         }
         if(§1t9549s0§ != null && _loc1_.contains(§1t9549s0§))
         {
            _loc1_.removeChild(§1t9549s0§);
         }
         System.pauseForGCIfCollectionImminent(0);
      }
      
      public static function §1t9938s0§(param1:§1t75s0§, param2:int) : *
      {
         §1t9899s0§.§1t8148s0§().addChild(param1);
         player.setPosition(param2 + §1t8131s0§(),§1t4467s0§());
      }
      
      public static function update() : *
      {
         if(§1t9956s0§)
         {
            §1t9961s0§();
         }
         if(actionState != §1t9902s0§)
         {
            §1t1541s0§.update();
            player.update();
            if(!§1t1540s0§.§1t10015s0§() && !§1t9952s0§() && (§1t1541s0§.§1t10100s0§() || §1t406s0§.instance.§1t6496s0§.§1t6853s0§()))
            {
               §1t1543s0§.§1t10198s0§();
               §1t1543s0§.§1t10199s0§();
            }
            else
            {
               §1t1543s0§.update();
            }
            §1t1712s0§.update();
            §1t157s0§.§1t9190s0§().update();
            if(§1t9906s0§ != null)
            {
               §1t9906s0§.update();
            }
            if((action == 7 || §1t1540s0§.§1t10047s0§()) && !§1t406s0§.instance.§1t6496s0§.§1t6853s0§())
            {
               ++§1t9910s0§;
               if(§1t9910s0§ >= 3)
               {
                  §1t9899s0§.§1t8143s0§(player.§1t1559s0§());
                  §1t9910s0§ = 0;
               }
               §1t9899s0§.§1t8144s0§();
            }
         }
         ++§1t9548s0§;
         if(§1t9548s0§ == 24)
         {
            §1t9548s0§ = 0;
            ++timeCounter;
            if(§1t9904s0§ > 0)
            {
               §1t9906s0§.§1t5213s0§(§1t9904s0§ - timeCounter);
            }
            if(action != §1t1540s0§.§1t10001s0§ && action != §1t1540s0§.§1t10002s0§ && timeCounter == 1)
            {
               actionState = §1t9903s0§;
            }
            else if(action == §1t1540s0§.§1t10001s0§)
            {
               if(timeCounter == 1)
               {
                  §1t251s0§.instance.§1t3489s0§(§1t1523s0§.stance);
               }
               else if(timeCounter == 3 && §1t113s0§.instance.§1t5248s0§())
               {
                  actionState = §1t9903s0§;
               }
            }
         }
         if(§1t9899s0§ != null)
         {
            §1t9899s0§.update();
         }
         if(§1t9904s0§ > 0 && timeCounter >= §1t9904s0§)
         {
            if(action == §1t1540s0§.§1t9998s0§ || action == §1t1540s0§.§1t9999s0§ || §1t1540s0§.§1t10048s0§())
            {
               §1t2292s0§();
               §1t1540s0§.§1t10054s0§(true);
            }
            else if(action == §1t1540s0§.§1t9996s0§ || action == §1t1540s0§.§1t9997s0§ || action == §1t1540s0§.§1t10000s0§)
            {
               §1t2292s0§();
               §1t1540s0§.§1t10054s0§(false);
            }
            else if(action == §1t1540s0§.§1t10001s0§)
            {
            }
         }
         if(§1t9905s0§ > 0)
         {
            --§1t9905s0§;
            if(!§1t1523s0§.§1t9586s0§().§1t2364s0§())
            {
               if(§1t9905s0§ == 24 * 5)
               {
                  §1t3310s0§();
                  if(!§1t1540s0§.§1t10049s0§())
                  {
                     §1t9906s0§.§1t5217s0§();
                  }
                  else
                  {
                     §1t9906s0§.§1t5220s0§();
                     §1t1541s0§.§1t10111s0§();
                  }
               }
               else if(§1t9905s0§ == 24 && §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t1558s0§() != §1t1544s0§.§1t10263s0§ || §1t9905s0§ == 0)
               {
                  §1t9905s0§ = -2;
                  if(§1t251s0§.instance.§1t3506s0§())
                  {
                     §1t9906s0§.§1t5218s0§();
                  }
                  §1t1540s0§.§1t10054s0§(true);
               }
            }
            else if(§1t9905s0§ == 24 * 3)
            {
               §1t9905s0§ = -2;
               if(§1t1540s0§.§1t9550s0§())
               {
                  Stage(§1t9899s0§.parent).addChild(§1t9906s0§);
                  §1t9906s0§.visible = true;
               }
               §1t9906s0§.§1t5219s0§();
               §1t1540s0§.§1t10054s0§(false);
            }
         }
      }
      
      public static function §1t9939s0§() : Boolean
      {
         return §1t9904s0§ > 0 && timeCounter >= §1t9904s0§ && action == §1t1540s0§.§1t10009s0§;
      }
      
      public static function §1t9940s0§() : §1t112s0§
      {
         return §1t9899s0§;
      }
      
      public static function §1t9941s0§() : §1t113s0§
      {
         return §1t9906s0§;
      }
      
      public static function §1t9942s0§() : MovieClip
      {
         if(§1t9899s0§ == null)
         {
            return null;
         }
         return §1t9899s0§.§1t8148s0§();
      }
      
      public static function §1t9943s0§() : *
      {
         §1t9899s0§ = null;
      }
      
      public static function §1t8124s0§() : int
      {
         return §1t9899s0§.§1t8124s0§();
      }
      
      public static function §1t4467s0§() : int
      {
         return §1t9899s0§.§1t2184s0§;
      }
      
      public static function §1t8125s0§() : Boolean
      {
         return §1t9899s0§.§1t2185s0§;
      }
      
      public static function §1t8129s0§(param1:int) : *
      {
         §1t9899s0§.§1t8129s0§(param1);
      }
      
      public static function §1t8131s0§() : int
      {
         return §1t9899s0§.§1t8131s0§();
      }
      
      public static function §1t8130s0§() : *
      {
         §1t9899s0§.§1t8130s0§();
      }
      
      public static function §1t9586s0§() : §1t99s0§
      {
         return player;
      }
      
      public static function §1t9944s0§(param1:§1t99s0§) : *
      {
         player = param1;
      }
      
      public static function §1t9945s0§() : int
      {
         return §1t9904s0§;
      }
      
      public static function §1t775s0§() : int
      {
         return action;
      }
      
      public static function §1t9946s0§(param1:int) : *
      {
         actionState = param1;
      }
      
      public static function §1t9947s0§() : Boolean
      {
         return actionState == §1t9901s0§;
      }
      
      public static function §1t9948s0§() : Boolean
      {
         return actionState == §1t9903s0§;
      }
      
      public static function §1t8127s0§(param1:int) : *
      {
         §1t9899s0§.§1t8127s0§(param1);
         §1t1543s0§.§1t2289s0§(-param1);
         §1t1712s0§.§1t2289s0§(-param1);
         §1t157s0§.§1t9190s0§().§1t2289s0§(-param1);
         §1t9899s0§.§1t8128s0§(param1);
      }
      
      public static function §1t9951s0§() : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:§1t75s0§ = §1t1523s0§.§1t9586s0§().mcs;
         var _loc2_:int = §1t1523s0§.§1t9586s0§().§1t1555s0§();
         var _loc3_:int = §1t9899s0§.§1t8114s0§;
         if(_loc2_ < §1t9949s0§)
         {
            _loc5_ = 0;
            _loc1_.x = _loc2_;
         }
         else if(_loc2_ > §1t9899s0§.§1t7574s0§ - §1t9950s0§)
         {
            _loc5_ = -(§1t9899s0§.§1t7574s0§ - 800);
            _loc1_.x = 800 - (§1t9899s0§.§1t7574s0§ - _loc2_);
         }
         else
         {
            _loc5_ = 400 - _loc2_;
            _loc1_.x = 400;
         }
         _loc4_ = _loc5_ - _loc3_;
         §1t8127s0§(_loc4_);
      }
      
      public static function §1t9952s0§() : Boolean
      {
         return §1t9905s0§ != -1;
      }
      
      public static function §1t9953s0§() : Boolean
      {
         return §1t9905s0§ > 0;
      }
      
      public static function §1t2292s0§() : *
      {
         if(§1t9952s0§())
         {
            return;
         }
         if(§1t9899s0§ != null)
         {
            §1t9899s0§.§1t2292s0§();
         }
         §1t1543s0§.§1t2292s0§();
         if(§1t1540s0§.§1t10049s0§())
         {
            §1t1523s0§.§1t9586s0§().§1t1559s0§().visible = false;
            §1t1541s0§.§1t10111s0§();
         }
         else
         {
            §1t1523s0§.§1t9586s0§().§1t2292s0§();
         }
         §1t9906s0§.§1t5224s0§();
         if(action == §1t1540s0§.§1t10003s0§)
         {
            §1t9905s0§ = 24 * 3 + 6;
            §1t3310s0§();
         }
         else
         {
            §1t9905s0§ = 24 * 6;
         }
         §1t1541s0§.§1t10099s0§();
         §1t1541s0§.§1t10111s0§();
         §1t1712s0§.§1t2292s0§();
         §1t157s0§.§1t9190s0§().§1t2292s0§();
         §1t6495s0§.instance.§1t1023s0§(0);
         §1t1523s0§.§1t9724s0§();
         if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t9550s0§())
         {
            if(§1t9899s0§ != null)
            {
               §1t9899s0§.§1t8137s0§();
            }
            §1t406s0§.instance.§1t6457s0§.visible = false;
            §1t406s0§.instance.§1t6441s0§.visible = false;
            §1t411s0§.instance.visible = false;
            §1t402s0§.instance.visible = false;
            §1t406s0§.instance.§1t6457s0§.mask = null;
            §1t406s0§.instance.§1t5159s0§.visible = false;
            §1t406s0§.instance.§1t6444s0§.visible = false;
            if(§1t1540s0§.§1t9550s0§())
            {
               §1t406s0§.instance.§1t6535s0§();
               §1t406s0§.instance.§1t6613s0§();
            }
         }
      }
      
      public static function §1t5254s0§() : *
      {
         §1t9906s0§.§1t5254s0§();
      }
      
      public static function §1t3310s0§() : *
      {
         §1t1543s0§.§1t3310s0§();
         player.§1t3310s0§();
      }
      
      public static function §1t3311s0§() : *
      {
         §1t1543s0§.§1t3311s0§();
         player.§1t3311s0§();
      }
      
      public static function §1t9954s0§() : *
      {
         var _loc1_:§1t6172s0§ = §1t9549s0§.§1t6488s0§;
         _loc1_.visible = true;
         var _loc2_:int = §1t1523s0§.getLevel();
         _loc1_.show();
         var _loc3_:* = §1t1523s0§.getLevel();
         if(_loc2_ < _loc3_)
         {
            §1t9955s0§(_loc3_ - _loc2_);
         }
      }
      
      public static function §1t9955s0§(param1:int) : *
      {
         var _loc2_:§1t6076s0§ = §1t9549s0§.§1t6490s0§;
         _loc2_.visible = true;
         var _loc3_:* = §1t1523s0§.getLevel();
         var _loc4_:int = §1t1523s0§.§1t5928s0§(_loc3_) - §1t1523s0§.§1t912s0§();
         _loc2_.show(_loc3_,_loc4_,param1);
         var _loc5_:§1t6172s0§ = §1t9549s0§.§1t6488s0§;
         _loc2_.§1t6086s0§(_loc5_);
         _loc5_.visible = false;
      }
      
      public static function §1t8143s0§(param1:MovieClip) : *
      {
         §1t9899s0§.§1t8143s0§(param1);
      }
      
      public static function §1t8140s0§(param1:int, param2:int) : *
      {
         §1t9899s0§.§1t8140s0§(param1,param2);
      }
      
      public static function §1t8142s0§() : *
      {
         if(§1t9899s0§ != null)
         {
            §1t9899s0§.§1t8142s0§();
         }
      }
      
      public static function §1t8147s0§() : *
      {
         §1t9899s0§.§1t8147s0§();
      }
      
      public static function §1t8141s0§(param1:int, param2:int) : *
      {
         §1t9899s0§.§1t8141s0§(param1,param2);
      }
      
      public static function §1t9960s0§(param1:int, param2:int = 30) : *
      {
         if(§1t9956s0§ && §1t9958s0§ > param2)
         {
            return;
         }
         §1t9956s0§ = true;
         §1t9957s0§ = param1;
         §1t9958s0§ = param2;
         §1t9959s0§ = new Point(§1t9899s0§.x,§1t9899s0§.y);
      }
      
      internal static function §1t9961s0§() : *
      {
         var _loc1_:Number = NaN;
         --§1t9957s0§;
         if(§1t9899s0§ == null)
         {
            §1t9956s0§ = false;
            return;
         }
         if(§1t9957s0§ == 0)
         {
            §1t9956s0§ = false;
            §1t9899s0§.x = §1t9959s0§.x;
            §1t9899s0§.y = §1t9959s0§.y;
         }
         else
         {
            _loc1_ = Math.min(§1t9958s0§,§1t9957s0§);
            §1t9899s0§.x = §1t9959s0§.x + (-_loc1_ / 2 + Math.random() * _loc1_);
            §1t9899s0§.y = §1t9959s0§.y + (-_loc1_ / 2 + Math.random() * _loc1_);
         }
      }
   }
}

