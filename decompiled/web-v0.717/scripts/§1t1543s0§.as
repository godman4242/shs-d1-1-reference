package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §1t1543s0§
   {
      
      internal static var canvas:MovieClip;
      
      internal static var §1t10177s0§:int;
      
      internal static var §1t10178s0§:int;
      
      internal static var §1t10179s0§:int;
      
      internal static var §1t10180s0§:int;
      
      internal static var endless:Boolean;
      
      internal static var §1t10181s0§:int;
      
      internal static var §1t10182s0§:int;
      
      internal static var §1t10183s0§:Array = new Array();
      
      internal static var §1t10184s0§:Array = new Array();
      
      internal static var §1t10185s0§:Array = new Array();
      
      internal static var §1t5730s0§:Array = new Array();
      
      internal static var §1t10186s0§:Array = new Array();
      
      internal static var §1t10187s0§:Array = new Array();
      
      internal static var §1t10188s0§:Vector.<§1t68s0§> = new Vector.<§1t68s0§>();
      
      internal static var §1t10189s0§:Vector.<§1t68s0§> = new Vector.<§1t68s0§>();
      
      internal static var §1t10190s0§:Vector.<Vector.<§1t2208s0§>> = new Vector.<Vector.<§1t2208s0§>>();
      
      internal static var §1t10191s0§:Vector.<Vector.<§1t2208s0§>> = new Vector.<Vector.<§1t2208s0§>>();
      
      internal static var §1t10192s0§:Vector.<Vector.<§1t2208s0§>> = new Vector.<Vector.<§1t2208s0§>>();
      
      internal static var §1t10193s0§:Vector.<Vector.<§1t2208s0§>> = new Vector.<Vector.<§1t2208s0§>>();
      
      internal static var §1t10194s0§:int = 0;
      
      internal static var §1t9380s0§:int = 0;
      
      internal static var §1t10195s0§:Vector.<§1t76s0§> = new Vector.<§1t76s0§>();
      
      internal static var §1t10255s0§:String = "";
      
      public function §1t1543s0§()
      {
         super();
      }
      
      public static function reset() : *
      {
         §1t10188s0§.fixed = false;
         §1t10189s0§.fixed = false;
         §1t10195s0§.fixed = false;
         §1t10185s0§.length = 0;
         §1t5730s0§.length = 0;
         §1t10186s0§.length = 0;
         §1t10188s0§.length = 0;
         §1t10189s0§.length = 0;
         §1t10195s0§.length = 0;
         §1t10187s0§.length = 0;
         §1t10190s0§.fixed = false;
         §1t10191s0§.fixed = false;
         §1t10192s0§.fixed = false;
         §1t10193s0§.fixed = false;
         §1t10190s0§.length = 0;
         §1t10191s0§.length = 0;
         §1t10192s0§.length = 0;
         §1t10193s0§.length = 0;
         §1t10177s0§ = -1;
         §1t10178s0§ = -1;
         endless = false;
         canvas = null;
         §1t10194s0§ = 0;
         §1t10181s0§ = 0;
         §1t10182s0§ = 0;
      }
      
      public static function init(param1:Vector.<§1t116s0§>) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         reset();
         canvas = §1t1525s0§.§1t9942s0§();
         var _loc2_:int = int(param1.length);
         while(_loc12_ < _loc2_)
         {
            if(param1[_loc12_].endless == 1)
            {
               endless = true;
            }
            §1t10192s0§.push(new Vector.<§1t2208s0§>());
            §1t10193s0§.push(new Vector.<§1t2208s0§>());
            _loc8_ = param1[_loc12_].enemy.length();
            if(_loc8_ > 0)
            {
               §1t10190s0§.push(new Vector.<§1t2208s0§>());
            }
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               _loc5_ = int(param1[_loc12_].enemy[_loc3_].qty);
               _loc7_ = param1[_loc12_].enemy[_loc3_].fatal;
               _loc9_ = param1[_loc12_].enemy[_loc3_].x;
               _loc10_ = param1[_loc12_].enemy[_loc3_].lvl;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  _loc11_ = param1[_loc12_].enemy[_loc3_].id.split("|");
                  if(_loc11_.length == 1)
                  {
                     _loc6_ = int(_loc11_[0]);
                  }
                  else
                  {
                     _loc6_ = int(_loc11_[int(Math.random() * _loc11_.length)]);
                  }
                  §1t10196s0§(_loc6_);
                  if(_loc9_ != "")
                  {
                     _loc9_ = int(int(_loc9_) + Math.random() * 80 - 40).toString();
                  }
                  §1t10190s0§[_loc12_].push(new §1t2208s0§(_loc6_,_loc7_,_loc9_,_loc10_));
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc8_ = param1[_loc12_].friend.length();
            if(_loc8_ > 0)
            {
               §1t10191s0§.push(new Vector.<§1t2208s0§>());
            }
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               _loc5_ = int(param1[_loc12_].friend[_loc3_].qty);
               _loc7_ = param1[_loc12_].friend[_loc3_].fatal;
               _loc9_ = param1[_loc12_].friend[_loc3_].x;
               _loc10_ = param1[_loc12_].friend[_loc3_].lvl;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  _loc11_ = param1[_loc12_].friend[_loc3_].id.split("|");
                  if(_loc11_.length == 1)
                  {
                     _loc6_ = int(_loc11_[0]);
                  }
                  else
                  {
                     _loc6_ = int(_loc11_[int(Math.random() * _loc11_.length)]);
                  }
                  if(_loc6_ == §1t76s0§.§1t9201s0§)
                  {
                     if(§1t10258s0§())
                     {
                        §1t10196s0§(_loc6_);
                        §1t10191s0§[_loc12_].push(new §1t2208s0§(_loc6_,"0",_loc9_,_loc10_));
                     }
                  }
                  else
                  {
                     §1t10196s0§(_loc6_);
                     §1t10191s0§[_loc12_].push(new §1t2208s0§(_loc6_,_loc7_,_loc9_,_loc10_));
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc8_ = param1[_loc12_].neutral.length();
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               _loc5_ = int(param1[_loc12_].neutral[_loc3_].qty);
               _loc7_ = param1[_loc12_].neutral[_loc3_].fatal;
               _loc9_ = param1[_loc12_].neutral[_loc3_].x;
               _loc10_ = param1[_loc12_].neutral[_loc3_].lvl;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  _loc11_ = param1[_loc12_].neutral[_loc3_].id.split("|");
                  if(_loc11_.length == 1)
                  {
                     _loc6_ = int(_loc11_[0]);
                  }
                  else
                  {
                     _loc6_ = int(_loc11_[int(Math.random() * _loc11_.length)]);
                  }
                  §1t10196s0§(_loc6_);
                  §1t10192s0§[_loc12_].push(new §1t2208s0§(_loc6_,_loc7_,_loc9_,_loc10_));
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc8_ = param1[_loc12_].objective.length();
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               _loc6_ = int(param1[_loc12_].objective[_loc3_].id);
               _loc5_ = int(param1[_loc12_].objective[_loc3_].qty);
               _loc7_ = param1[_loc12_].objective[_loc3_].fatal;
               _loc9_ = param1[_loc12_].objective[_loc3_].x;
               _loc10_ = param1[_loc12_].objective[_loc3_].lvl;
               §1t10196s0§(_loc6_);
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  §1t10193s0§[_loc12_].push(new §1t2208s0§(_loc6_,_loc7_,_loc9_,_loc10_));
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc12_++;
         }
         §1t10179s0§ = §1t10190s0§.length;
         §1t10180s0§ = §1t10191s0§.length;
         §1t10190s0§.fixed = true;
         §1t10191s0§.fixed = true;
         §1t10192s0§.fixed = true;
         §1t10193s0§.fixed = true;
         §1t10204s0§();
         §1t10203s0§();
      }
      
      internal static function §1t10196s0§(param1:int) : *
      {
         var _loc2_:int = int(§1t10195s0§.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(§1t10195s0§[_loc3_].id == param1)
            {
               return;
            }
            _loc3_--;
         }
         var _loc4_:§1t76s0§ = §1t1524s0§.§1t9874s0§(param1);
         if(_loc4_ != null)
         {
            §1t10195s0§.fixed = false;
            §1t10195s0§.push(_loc4_);
            §1t10195s0§.fixed = true;
         }
      }
      
      public static function §1t10197s0§(param1:int) : §1t76s0§
      {
         var _loc2_:int = int(§1t10195s0§.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(§1t10195s0§[_loc3_].id == param1)
            {
               return §1t10195s0§[_loc3_];
            }
            _loc3_--;
         }
         return null;
      }
      
      public static function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         _loc1_ = §1t10185s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t10185s0§[_loc2_] != null)
            {
               §1t10185s0§[_loc2_].update();
            }
            _loc2_--;
         }
         _loc1_ = §1t5730s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t5730s0§[_loc2_] != null)
            {
               §1t5730s0§[_loc2_].update();
            }
            _loc2_--;
         }
         _loc1_ = §1t10186s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t10186s0§[_loc2_] != null)
            {
               §1t10186s0§[_loc2_].update();
            }
            _loc2_--;
         }
      }
      
      public static function §1t3268s0§() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         _loc1_ = §1t10185s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t10185s0§[_loc2_] != null)
            {
               §1t10185s0§[_loc2_].§1t3268s0§();
            }
            _loc2_--;
         }
         _loc1_ = §1t5730s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t5730s0§[_loc2_] != null)
            {
               §1t5730s0§[_loc2_].§1t3268s0§();
            }
            _loc2_--;
         }
         _loc1_ = §1t10186s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t10186s0§[_loc2_] != null)
            {
               §1t10186s0§[_loc2_].§1t3268s0§();
            }
            _loc2_--;
         }
      }
      
      public static function §1t10198s0§() : *
      {
         var _loc1_:int = int(§1t10187s0§.length);
         var _loc2_:* = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            if(§1t10187s0§[_loc2_] != null)
            {
               §1t10187s0§[_loc2_].update();
            }
            _loc2_--;
         }
      }
      
      public static function §1t10199s0§() : *
      {
         var _loc2_:§1t68s0§ = null;
         var _loc1_:int = int(§1t10189s0§.length);
         var _loc3_:* = int(_loc1_ - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = §1t10189s0§[_loc3_];
            if(_loc2_ != null)
            {
               _loc2_.update();
            }
            _loc3_--;
         }
      }
      
      public static function §1t10200s0§() : *
      {
         if(§1t1540s0§.§1t10047s0§())
         {
            return;
         }
         var _loc1_:Boolean = true;
         var _loc2_:int = int(§1t10185s0§.length);
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(!§1t10185s0§[_loc3_].§1t3258s0§)
            {
               _loc1_ = false;
            }
            _loc3_--;
         }
         if(_loc1_)
         {
            cleanUp();
            §1t10204s0§();
         }
      }
      
      public static function §1t10201s0§() : *
      {
         if(§1t1540s0§.§1t10047s0§())
         {
            return;
         }
         var _loc1_:Boolean = true;
         var _loc2_:int = int(§1t5730s0§.length);
         var _loc3_:* = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(!§1t5730s0§[_loc3_].§1t3258s0§)
            {
               _loc1_ = false;
            }
            _loc3_--;
         }
         if(_loc1_)
         {
            cleanUp();
            §1t10203s0§();
         }
      }
      
      public static function §1t10202s0§(param1:int) : *
      {
         §1t10177s0§ = param1;
         if(§1t10177s0§ >= §1t10179s0§)
         {
            §1t10177s0§ = §1t10179s0§ - 1;
         }
         --§1t10177s0§;
      }
      
      public static function §1t10203s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§1t2208s0§ = null;
         ++§1t10178s0§;
         if(§1t10178s0§ < §1t10180s0§)
         {
            _loc4_ = §1t1525s0§.§1t4467s0§();
            _loc2_ = int(§1t10191s0§[§1t10178s0§].length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               _loc5_ = §1t10191s0§[§1t10178s0§][_loc1_];
               §1t10215s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               _loc1_++;
            }
         }
      }
      
      public static function §1t10204s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§1t2208s0§ = null;
         ++§1t10177s0§;
         if(§1t10177s0§ >= §1t10179s0§)
         {
            if(endless && !§1t1525s0§.§1t9939s0§())
            {
               §1t10177s0§ -= 2;
               §1t10204s0§();
            }
         }
         else
         {
            §1t10188s0§.fixed = false;
            if(§1t10177s0§ == 0)
            {
               _loc4_ = §1t1525s0§.§1t4467s0§();
            }
            else
            {
               _loc4_ = 0;
            }
            _loc2_ = int(§1t10190s0§[§1t10177s0§].length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               _loc5_ = §1t10190s0§[§1t10177s0§][_loc1_];
               if(§1t10177s0§ == 0)
               {
                  §1t10214s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               else
               {
                  §1t10214s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_ - Math.random() * 200,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               _loc1_++;
            }
            _loc2_ = int(§1t10192s0§[§1t10177s0§].length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               _loc5_ = §1t10192s0§[§1t10177s0§][_loc1_];
               if(§1t10177s0§ == 0)
               {
                  §1t10216s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               else
               {
                  §1t10216s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_ - Math.random() * 200,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               _loc1_++;
            }
            _loc2_ = int(§1t10193s0§[§1t10177s0§].length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               _loc5_ = §1t10193s0§[§1t10177s0§][_loc1_];
               if(§1t10177s0§ == 0)
               {
                  §1t10217s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               else
               {
                  §1t10217s0§(_loc5_.§1t2212s0§(),_loc5_.§1t2214s0§(),_loc4_ - Math.random() * 200,_loc5_.§1t2213s0§(),_loc5_.§1t2216s0§());
               }
               _loc1_++;
            }
            §1t10188s0§.fixed = true;
         }
      }
      
      public static function §1t10205s0§(param1:§1t99s0§) : *
      {
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         var _loc2_:§1t4904s0§ = new §1t4904s0§(§1t1744s0§.§1t1559s0§());
         _loc2_.§1t1551s0§(canvas);
         _loc2_.setPosition(param1.§1t1555s0§(),param1.§1t1559s0§().y);
         _loc2_.§1t4905s0§(param1,false);
         §1t1712s0§.§1t11333s0§(_loc2_.§1t1555s0§(),_loc2_.§1t1559s0§().y);
         _loc2_.§1t1557s0§(§1t1544s0§.§1t10925s0§);
         _loc2_.actionState = §1t1544s0§.§1t11162s0§;
         if(_loc2_.§1t3315s0§())
         {
            §1t5730s0§.push(_loc2_);
         }
         else
         {
            §1t10185s0§.push(_loc2_);
         }
         §1t10189s0§.fixed = false;
         §1t10189s0§.push(_loc2_);
         §1t10189s0§.fixed = true;
      }
      
      public static function §1t10206s0§(param1:§1t99s0§) : *
      {
         var _loc3_:§1t4904s0§ = null;
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = new §1t4904s0§(§1t1744s0§.§1t1559s0§());
            _loc3_.§1t1551s0§(canvas);
            _loc3_.setPosition(param1.§1t1555s0§() - 100 + _loc2_ * 50,param1.§1t1559s0§().y);
            _loc3_.§1t4905s0§(param1,true);
            §1t1712s0§.§1t11333s0§(_loc3_.§1t1555s0§(),_loc3_.§1t1559s0§().y);
            _loc3_.§1t1557s0§(§1t1544s0§.§1t10925s0§);
            _loc3_.actionState = §1t1544s0§.§1t11162s0§;
            if(_loc3_.§1t3315s0§())
            {
               §1t5730s0§.push(_loc3_);
            }
            else
            {
               §1t10185s0§.push(_loc3_);
            }
            §1t10189s0§.fixed = false;
            §1t10189s0§.push(_loc3_);
            §1t10189s0§.fixed = true;
            _loc2_++;
         }
      }
      
      internal static function §1t600s0§(param1:int, param2:int, param3:int, param4:Boolean) : §1t68s0§
      {
         var _loc5_:§1t68s0§ = null;
         var _loc6_:§1t76s0§ = §1t10197s0§(param1);
         if(_loc6_ == null)
         {
            _loc6_ = §1t1524s0§.§1t9874s0§(param1);
            if(_loc6_ == null)
            {
               §1t10200s0§();
               return null;
            }
            §1t10196s0§(param1);
         }
         switch(_loc6_.ai)
         {
            case 0:
               _loc5_ = new §1t122s0§(§1t1744s0§.§1t1559s0§(),true,false);
               break;
            case 1:
               _loc5_ = new §1t4569s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 2:
               _loc5_ = new §1t4542s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 3:
               _loc5_ = new §1t4572s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 4:
               _loc5_ = new §1t4563s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 5:
               _loc5_ = new §1t4581s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 6:
               _loc5_ = new §1t4534s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 7:
               _loc5_ = new §1t4518s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 8:
               _loc5_ = new §1t4573s0§();
               break;
            case 9:
               _loc5_ = new §1t122s0§(§1t1744s0§.§1t1559s0§(),false,false);
               break;
            case 10:
               _loc5_ = new §1t4903s0§();
               break;
            case 11:
               _loc5_ = new §1t4548s0§();
               break;
            case 12:
               _loc5_ = new §1t4584s0§();
               break;
            case 13:
               _loc5_ = new §1t4558s0§();
               break;
            case 14:
               _loc5_ = new §1t122s0§(§1t1744s0§.§1t1559s0§(),false,true);
               break;
            case 15:
               _loc5_ = new §1t4908s0§(§1t1744s0§.§1t1559s0§(),false);
               break;
            case 16:
               _loc5_ = new §1t4532s0§();
               break;
            case 17:
               _loc5_ = new §1t4529s0§();
               break;
            case 18:
               _loc5_ = new §1t4561s0§();
               break;
            case 19:
               _loc5_ = new §1t4553s0§();
               break;
            case 20:
               _loc5_ = new §1t4565s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 21:
               _loc5_ = new §1t4555s0§();
               break;
            case 22:
               _loc5_ = new §1t4549s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 23:
               _loc5_ = new §1t4554s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 24:
               _loc5_ = new §1t4902s0§();
               break;
            case 25:
               _loc5_ = new §1t4539s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 26:
               _loc5_ = new §1t4570s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 27:
               _loc5_ = new §1t4571s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 28:
               _loc5_ = new §1t4523s0§(§1t1744s0§.§1t1559s0§(),false);
               break;
            case 29:
               _loc5_ = new §1t4907s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 30:
               _loc5_ = new §1t4906s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 31:
               _loc5_ = new §1t4900s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 32:
               _loc5_ = new §1t4899s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 33:
               _loc5_ = new §1t4898s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 34:
               _loc5_ = new §1t4901s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 35:
               _loc5_ = new §1t4574s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 36:
               _loc5_ = new §1t4545s0§(§1t1744s0§.§1t1559s0§());
               break;
            case 37:
               _loc5_ = new §1t4523s0§(§1t1744s0§.§1t1559s0§(),true);
               break;
            case 38:
               _loc5_ = new §1t4551s0§();
         }
         _loc5_.§1t1551s0§(canvas);
         _loc5_.setPosition(param2,param3);
         _loc5_.init(_loc6_);
         if(_loc6_.scaleX != 1 || _loc6_.scaleY != 1)
         {
            _loc5_.§1t1559s0§().§1t6284s0§(_loc6_.scaleX,_loc6_.scaleY);
         }
         _loc5_.§1t3297s0§(param4);
         if(§1t1540s0§.§1t10046s0§() && _loc6_.ai == 0)
         {
            if(_loc6_.rightPos)
            {
               _loc5_.setPosition(650,param3);
               _loc5_.mcs.§1t5492s0§();
            }
            else
            {
               _loc5_.setPosition(150,param3);
               _loc5_.mcs.§1t5493s0§();
            }
            _loc5_.§1t1557s0§(§1t1544s0§.§1t10373s0§);
            §1t10189s0§.fixed = false;
            §1t10189s0§.push(_loc5_);
            §1t10189s0§.fixed = true;
         }
         else if(§1t1523s0§.§1t9586s0§().mcs.x < _loc5_.§1t1559s0§().x)
         {
            _loc5_.§1t1559s0§().§1t5492s0§();
         }
         else
         {
            _loc5_.mcs.§1t5493s0§();
         }
         return _loc5_;
      }
      
      public static function §1t10207s0§(param1:int, param2:int, param3:String, param4:String, param5:int) : §1t68s0§
      {
         var _loc13_:§1t122s0§ = null;
         var _loc6_:Array = param3.split(",");
         var _loc7_:int = int(_loc6_[0]);
         var _loc8_:int = int(_loc6_[1]);
         var _loc9_:int = int(_loc6_[2]);
         var _loc10_:int = int(_loc6_[3]);
         var _loc11_:Boolean = _loc6_[4] == "1";
         var _loc12_:§1t122s0§ = §1t10225s0§(param4);
         if(_loc12_ != null && !_loc12_.§1t3258s0§)
         {
            _loc12_.setPosition(param1,param2);
            _loc12_.§1t3257s0§ = _loc9_;
            _loc12_.§1t3308s0§(_loc9_);
            _loc12_.§1t3269s0§(_loc10_);
            if(_loc11_)
            {
               _loc12_.§1t1559s0§().§1t5493s0§();
            }
            else
            {
               _loc12_.§1t1559s0§().§1t5492s0§();
            }
            return _loc12_;
         }
         if(canvas == null)
         {
            canvas = §1t1525s0§.§1t9942s0§();
         }
         var _loc14_:§1t76s0§ = §1t1524s0§.§1t9874s0§(_loc7_);
         if(_loc14_ == null)
         {
            return null;
         }
         if(_loc14_.ai == 100)
         {
            _loc13_ = new §1t4909s0§(§1t1744s0§.§1t1559s0§());
         }
         else if(_loc14_.ai == 101)
         {
            _loc13_ = new §1t4921s0§(§1t1744s0§.§1t1559s0§());
         }
         else
         {
            if(_loc14_.ai != 102)
            {
               return null;
            }
            _loc13_ = new §1t4914s0§(§1t1744s0§.§1t1559s0§());
         }
         canvas.addChild(_loc13_.mcs);
         _loc13_.setPosition(param1,param2);
         _loc13_.init(_loc14_);
         _loc13_.controlledBy = 4;
         _loc13_.nid = param4;
         if(_loc14_.scaleX != 1 || _loc14_.scaleY != 1)
         {
            _loc13_.§1t1559s0§().§1t6284s0§(_loc14_.scaleX,_loc14_.scaleY);
         }
         §1t10185s0§.fixed = false;
         §1t10185s0§.push(_loc13_);
         §1t10185s0§.fixed = true;
         §1t10189s0§.fixed = false;
         §1t10189s0§.push(_loc13_);
         §1t10189s0§.fixed = true;
         if(_loc8_ != 0)
         {
            _loc13_.setLevel(_loc8_);
         }
         if(_loc13_.§1t3257s0§ < _loc9_)
         {
            _loc13_.§1t3257s0§ = _loc9_;
         }
         _loc13_.§1t3308s0§(_loc9_);
         _loc13_.§1t3269s0§(_loc10_);
         if(_loc11_)
         {
            _loc13_.§1t1559s0§().§1t5493s0§();
         }
         else
         {
            _loc13_.§1t1559s0§().§1t5492s0§();
         }
         return _loc13_;
      }
      
      public static function §1t10208s0§(param1:int, param2:int, param3:int, param4:Boolean = false) : §1t68s0§
      {
         var _loc5_:§1t68s0§ = null;
         if(canvas == null)
         {
            canvas = §1t1525s0§.§1t9942s0§();
         }
         var _loc6_:§1t76s0§ = §1t1524s0§.§1t9874s0§(param1);
         if(_loc6_ == null)
         {
            return null;
         }
         if(_loc6_.ai == 8)
         {
            _loc5_ = new §1t4573s0§();
         }
         else if(_loc6_.ai == 11 || _loc6_.ai == 16)
         {
            _loc5_ = new §1t4548s0§();
         }
         else if(_loc6_.ai == 12)
         {
            _loc5_ = new §1t4584s0§(null,param4);
         }
         else if(_loc6_.ai == 17)
         {
            _loc5_ = new §1t4529s0§(null,param4);
         }
         else if(_loc6_.ai == 18)
         {
            _loc5_ = new §1t4561s0§(null,param4);
         }
         else if(_loc6_.ai == 19)
         {
            _loc5_ = new §1t4553s0§();
         }
         else if(_loc6_.ai == 22)
         {
            _loc5_ = new §1t4531s0§(null,param4);
         }
         else if(_loc6_.ai == 23)
         {
            _loc5_ = new §1t4544s0§(null,param4);
         }
         else if(_loc6_.ai == 24)
         {
            _loc5_ = new §1t4902s0§();
         }
         else if(_loc6_.ai == 26)
         {
            _loc5_ = new §1t4556s0§(null,param4);
         }
         else if(_loc6_.ai == 32)
         {
            _loc5_ = new §1t4899s0§(§1t1744s0§.§1t1559s0§());
         }
         else if(_loc6_.ai == 33)
         {
            _loc5_ = new §1t4898s0§(§1t1744s0§.§1t1559s0§(),param4);
         }
         else if(_loc6_.ai == 38)
         {
            _loc5_ = new §1t4551s0§();
         }
         else
         {
            _loc5_ = new §1t4518s0§(§1t1744s0§.§1t1559s0§(),param4);
         }
         canvas.addChild(_loc5_.mcs);
         _loc5_.setPosition(param2,param3);
         _loc5_.init(_loc6_);
         if(_loc6_.scaleX != 1 || _loc6_.scaleY != 1)
         {
            _loc5_.§1t1559s0§().§1t6284s0§(_loc6_.scaleX,_loc6_.scaleY);
         }
         §1t10186s0§.fixed = false;
         §1t10186s0§.push(_loc5_);
         §1t10186s0§.fixed = true;
         return _loc5_;
      }
      
      public static function §1t10209s0§(param1:§1t76s0§, param2:int, param3:int, param4:Boolean = false) : §1t68s0§
      {
         var _loc5_:§1t68s0§ = null;
         if(canvas == null)
         {
            canvas = §1t1525s0§.§1t9942s0§();
         }
         if(param1.ai == 32)
         {
            _loc5_ = new §1t4899s0§(§1t1744s0§.§1t1559s0§());
         }
         else if(param1.ai == 33)
         {
            _loc5_ = new §1t4898s0§(§1t1744s0§.§1t1559s0§(),param4);
         }
         else
         {
            _loc5_ = new §1t4518s0§(§1t1744s0§.§1t1559s0§(),param4);
         }
         canvas.addChild(_loc5_.mcs);
         _loc5_.setPosition(param2,param3);
         _loc5_.init(param1);
         if(param1.scaleX != 1 || param1.scaleY != 1)
         {
            _loc5_.§1t1559s0§().§1t6284s0§(param1.scaleX,param1.scaleY);
         }
         §1t10186s0§.fixed = false;
         §1t10186s0§.push(_loc5_);
         §1t10186s0§.fixed = true;
         return _loc5_;
      }
      
      public static function §1t10210s0§() : §1t68s0§
      {
         var _loc2_:§1t68s0§ = null;
         var _loc5_:§1t4518s0§ = null;
         var _loc1_:int = int(§1t10186s0§.length);
         var _loc3_:int = §1t1523s0§.§1t9586s0§().§1t1555s0§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = §1t10186s0§[_loc4_];
            if(_loc2_ is §1t4518s0§)
            {
               _loc5_ = §1t4518s0§(_loc2_);
               if(!_loc5_.§1t4519s0§ && !_loc5_.§1t4520s0§ && !_loc5_.§1t3258s0§ && !_loc5_.aggro)
               {
                  if(Math.abs(_loc5_.§1t1555s0§() - _loc3_) < 500)
                  {
                     _loc2_.§1t3269s0§(§1t1544s0§.§1t11141s0§);
                     return _loc2_;
                  }
                  return null;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function §1t3565s0§() : Boolean
      {
         return §1t10210s0§() != null;
      }
      
      public static function §1t10211s0§(param1:int, param2:int, param3:int) : §1t121s0§
      {
         var _loc4_:§1t121s0§ = null;
         if(canvas == null)
         {
            canvas = §1t1525s0§.§1t9942s0§();
         }
         var _loc5_:§1t76s0§ = §1t1524s0§.§1t9874s0§(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         _loc4_ = new §1t121s0§(§1t1744s0§.§1t1559s0§());
         canvas.addChild(_loc4_.mcs);
         _loc4_.setPosition(param2,param3);
         _loc4_.init(_loc5_);
         if(_loc5_.scaleX != 1 || _loc5_.scaleY != 1)
         {
            _loc4_.§1t1559s0§().§1t6284s0§(_loc5_.scaleX,_loc5_.scaleY);
         }
         §1t10186s0§.fixed = false;
         §1t10186s0§.push(_loc4_);
         §1t10186s0§.fixed = true;
         §1t10187s0§.push(_loc4_);
         return _loc4_;
      }
      
      public static function §1t10212s0§(param1:§1t68s0§) : *
      {
         var _loc3_:* = 0;
         param1.§1t1552s0§(§1t1525s0§.§1t9942s0§());
         param1.§1t3305s0§();
         var _loc2_:int = int(§1t10186s0§.length);
         _loc3_ = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(param1 == §1t10186s0§[_loc3_])
            {
               §1t10186s0§.fixed = false;
               §1t10186s0§.splice(_loc3_,1);
               §1t10186s0§.fixed = true;
            }
            _loc3_--;
         }
         _loc2_ = int(§1t10187s0§.length);
         _loc3_ = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            if(param1 == §1t10187s0§[_loc3_])
            {
               §1t10187s0§.fixed = false;
               §1t10187s0§.splice(_loc3_,1);
               §1t10187s0§.fixed = true;
            }
            _loc3_--;
         }
      }
      
      public static function §1t10213s0§() : int
      {
         var _loc1_:int = int(§1t10185s0§.length);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            if(!§1t10185s0§[_loc3_].§1t3258s0§)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function §1t10214s0§(param1:int, param2:int, param3:int, param4:Boolean, param5:int = 0) : §1t68s0§
      {
         var _loc6_:§1t68s0§ = §1t600s0§(param1,param2,param3,param4);
         if(_loc6_ == null)
         {
            return null;
         }
         §1t10185s0§.push(_loc6_);
         if(param5 != 0)
         {
            _loc6_.setLevel(param5);
         }
         return _loc6_;
      }
      
      public static function §1t10215s0§(param1:int, param2:int, param3:int, param4:Boolean, param5:int = 0) : §1t68s0§
      {
         var _loc6_:§1t68s0§ = §1t600s0§(param1,param2,param3,param4);
         if(_loc6_ == null)
         {
            return null;
         }
         §1t5730s0§.push(_loc6_);
         _loc6_.§1t3267s0§();
         if(param5 != 0)
         {
            _loc6_.setLevel(param5);
         }
         return _loc6_;
      }
      
      public static function §1t10216s0§(param1:int, param2:int, param3:int, param4:Boolean, param5:int = 0) : §1t68s0§
      {
         var _loc6_:§1t68s0§ = §1t600s0§(param1,param2,param3,param4);
         if(_loc6_ == null)
         {
            return null;
         }
         §1t10186s0§.push(_loc6_);
         if(param5 != 0)
         {
            _loc6_.setLevel(param5);
         }
         return _loc6_;
      }
      
      public static function §1t10217s0§(param1:int, param2:int, param3:int, param4:Boolean, param5:int = 0) : §1t68s0§
      {
         var _loc6_:§1t68s0§ = §1t600s0§(param1,param2,param3,param4);
         if(_loc6_ == null)
         {
            return null;
         }
         §1t10188s0§.push(_loc6_);
         if(§1t1525s0§.§1t775s0§() == §1t1540s0§.§1t9996s0§ || §1t1525s0§.§1t775s0§() == §1t1540s0§.§1t9997s0§)
         {
            §1t10185s0§.push(_loc6_);
         }
         else if(§1t1525s0§.§1t775s0§() == §1t1540s0§.§1t9998s0§)
         {
            §1t5730s0§.push(_loc6_);
         }
         _loc6_.setPosition(param2 - §1t1525s0§.§1t8131s0§(),param3);
         if(param5 != 0)
         {
            _loc6_.setLevel(param5);
         }
         return _loc6_;
      }
      
      public static function §1t10218s0§(param1:String, param2:String, param3:int, param4:String, param5:int, param6:int, param7:Boolean, param8:String, param9:int, param10:String, param11:String, param12:String, param13:int, param14:Boolean) : *
      {
         var _loc18_:int = 0;
         var _loc15_:§1t68s0§ = §1t3306s0§(param1);
         if(_loc15_ != null && !_loc15_.§1t3258s0§)
         {
            return;
         }
         if(param9 == §1t251s0§.§1t12138s0§)
         {
            return;
         }
         var _loc16_:§1t122s0§ = §1t10226s0§(param2);
         if(_loc16_ != null && _loc16_.nid != param1)
         {
            _loc16_.nid = param1;
            return;
         }
         if(param2 == §1t1523s0§.charname)
         {
            if(param1 != §1t251s0§.instance.§1t2055s0§())
            {
               §1t251s0§.instance.§1t3536s0§(param1);
               return;
            }
            return;
         }
         ++§1t10194s0§;
         if(canvas == null)
         {
            canvas = §1t1525s0§.§1t9942s0§();
         }
         if(canvas == null)
         {
            return;
         }
         var _loc17_:§1t122s0§ = new §1t122s0§(§1t1744s0§.§1t1559s0§(),true,false);
         if(param9 != §1t251s0§.§1t12136s0§)
         {
            _loc17_.§1t4894s0§(param9);
         }
         canvas.addChild(_loc17_.mcs);
         _loc17_.setPosition(param5,§1t1525s0§.§1t4467s0§());
         if(§1t1525s0§.§1t9923s0§() != §1t134s0§.§1t9234s0§ && !§1t1540s0§.§1t10048s0§())
         {
            param6 = 0;
         }
         _loc17_.§1t4881s0§(param1,param2,param3,param4,param10,param11,param12,param13,param6,param14);
         §1t10189s0§.fixed = false;
         §1t10189s0§.push(_loc17_);
         §1t10189s0§.fixed = true;
         if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
         {
            if(§1t251s0§.instance.§1t3612s0§())
            {
               if(param9 == 3)
               {
                  §1t10185s0§.push(_loc17_);
               }
               else
               {
                  §1t251s0§.instance.§1t3535s0§(_loc17_.charname,true);
                  §1t5730s0§.push(_loc17_);
               }
            }
            else if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9234s0§ || §1t1540s0§.§1t10048s0§())
            {
               if(param6 == §1t1523s0§.§1t7746s0§())
               {
                  §1t251s0§.instance.§1t3535s0§(_loc17_.charname,true);
                  §1t5730s0§.push(_loc17_);
               }
               else
               {
                  §1t10185s0§.push(_loc17_);
               }
            }
            else if(§1t10248s0§(param2))
            {
               §1t10243s0§(param2);
               §1t5730s0§.push(_loc17_);
               §1t251s0§.instance.§1t3535s0§(_loc17_.charname,true);
            }
            else if(param9 == 1)
            {
               §1t5730s0§.push(_loc17_);
            }
            else
            {
               §1t10185s0§.push(_loc17_);
            }
         }
         else
         {
            §1t10186s0§.push(_loc17_);
         }
         if(param7)
         {
            _loc17_.§1t1559s0§().§1t5493s0§();
         }
         else
         {
            _loc17_.§1t1559s0§().§1t5492s0§();
         }
         if(param8 != "")
         {
            _loc17_.§1t1557s0§(param8);
         }
         if(param14)
         {
            _loc18_ = §1t1525s0§.§1t8124s0§();
            if(param5 < 150)
            {
               _loc17_.§1t4452s0§(150);
            }
            else if(param5 > _loc18_ - 150)
            {
               _loc17_.§1t4452s0§(_loc18_ - 150);
            }
         }
         if(_loc17_.§1t3314s0§() && !§1t1540s0§.§1t10048s0§())
         {
            §1t10256s0§(_loc17_);
         }
      }
      
      public static function §1t10219s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t122s0§ = §1t10225s0§(param1);
         if(_loc3_ != null)
         {
            _loc3_.say(param2);
         }
      }
      
      public static function §1t10220s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t122s0§ = §1t10225s0§(param1);
         if(_loc3_ != null && _loc3_.§1t1559s0§() != null)
         {
            _loc3_.§1t1559s0§().§1t5491s0§(param2);
            _loc3_.equipmentStr = param2;
         }
      }
      
      public static function §1t10221s0§(param1:String, param2:int) : *
      {
         var _loc3_:§1t122s0§ = §1t10225s0§(param1);
         if(_loc3_ != null)
         {
            _loc3_.level = param2;
         }
      }
      
      public static function §1t10222s0§(param1:String, param2:Boolean) : *
      {
         var _loc3_:§1t122s0§ = §1t10225s0§(param1);
         if(_loc3_ != null)
         {
            _loc3_.§1t4884s0§(param2);
         }
      }
      
      public static function §1t10223s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t122s0§ = §1t10225s0§(param1);
         if(_loc3_ != null)
         {
            _loc3_.§1t1557s0§(param2);
         }
      }
      
      public static function §1t10224s0§(param1:String) : *
      {
         var _loc3_:int = 0;
         var _loc4_:§1t68s0§ = null;
         var _loc5_:* = 0;
         var _loc2_:§1t68s0§ = §1t3306s0§(param1);
         if(_loc2_ != null)
         {
            _loc2_.§1t1552s0§(§1t1525s0§.§1t9942s0§());
            _loc2_.§1t3305s0§();
            cleanUp();
            _loc3_ = int(§1t10189s0§.length);
            _loc5_ = int(_loc3_ - 1);
            while(_loc5_ >= 0)
            {
               _loc4_ = §1t10189s0§[_loc5_];
               if(_loc4_ == _loc2_)
               {
                  §1t10189s0§.fixed = false;
                  §1t10189s0§.splice(_loc5_,1);
                  §1t10189s0§.fixed = true;
               }
               _loc5_--;
            }
            --§1t10194s0§;
         }
      }
      
      public static function §1t3306s0§(param1:String) : §1t68s0§
      {
         var _loc2_:§1t122s0§ = null;
         var _loc3_:int = int(§1t10189s0§.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = §1t10189s0§[_loc4_] as §1t122s0§;
            if(param1 == _loc2_.§1t3306s0§())
            {
               return _loc2_;
            }
            _loc4_--;
         }
         return null;
      }
      
      public static function §1t10225s0§(param1:String) : §1t122s0§
      {
         var _loc2_:§1t122s0§ = null;
         var _loc3_:int = int(§1t10189s0§.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = §1t10189s0§[_loc4_] as §1t122s0§;
            if(param1 == _loc2_.§1t3306s0§())
            {
               return _loc2_;
            }
            _loc4_--;
         }
         return null;
      }
      
      public static function §1t10226s0§(param1:String) : §1t122s0§
      {
         var _loc2_:§1t122s0§ = null;
         var _loc3_:int = int(§1t10189s0§.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = §1t10189s0§[_loc4_] as §1t122s0§;
            if(param1 == _loc2_.charname)
            {
               return _loc2_;
            }
            _loc4_--;
         }
         return null;
      }
      
      public static function §1t10227s0§() : Vector.<§1t68s0§>
      {
         return §1t10189s0§;
      }
      
      public static function §1t10228s0§(param1:int, param2:int) : §1t122s0§
      {
         var _loc3_:§1t68s0§ = null;
         var _loc4_:int = int(§1t10189s0§.length);
         var _loc5_:* = int(_loc4_ - 1);
         while(_loc5_ >= 0)
         {
            _loc3_ = §1t10189s0§[_loc5_];
            if(_loc3_.§1t1559s0§().hitTestPoint(param1,param2))
            {
               return _loc3_ as §1t122s0§;
            }
            _loc5_--;
         }
         return null;
      }
      
      public static function §1t2289s0§(param1:int) : *
      {
         var _loc2_:* = 0;
         var _loc4_:§1t75s0§ = null;
         var _loc3_:* = §1t10185s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc4_ = §1t10185s0§[_loc2_].mcs;
            if(_loc4_ != null)
            {
               _loc4_.x -= param1;
            }
            _loc2_--;
         }
         _loc3_ = §1t5730s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc4_ = §1t5730s0§[_loc2_].mcs;
            if(_loc4_ != null)
            {
               _loc4_.x -= param1;
            }
            _loc2_--;
         }
         _loc3_ = §1t10186s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc4_ = §1t10186s0§[_loc2_].mcs;
            if(_loc4_ != null)
            {
               _loc4_.x -= param1;
            }
            _loc2_--;
         }
      }
      
      public static function §1t3273s0§(param1:Vector.<Point>, param2:int, param3:§1t67s0§, param4:Boolean = true) : *
      {
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:int = 0;
         var _loc9_:§1t68s0§ = null;
         var _loc11_:§1t7528s0§ = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc5_:int = int(param1.length);
         var _loc10_:int = 0;
         _loc6_ = §1t10185s0§.length;
         _loc7_ = _loc6_ - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = §1t10185s0§[_loc7_];
            if(!_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
            {
               _loc8_ = 0;
               while(_loc8_ < _loc5_ && !_loc9_.§1t3256s0§)
               {
                  _loc12_ = _loc9_.mcs.x - param1[_loc8_].x + param2;
                  _loc13_ = (param1[_loc8_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§;
                  _loc14_ = param1[_loc8_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
                  if(_loc12_ * _loc12_ < 40000 && _loc9_.mcs.hitTestPoint(_loc13_,_loc14_,false))
                  {
                     if(_loc9_.§1t3273s0§(_loc13_,_loc14_,param3))
                     {
                        if(!§1t1525s0§.§1t9952s0§())
                        {
                           _loc11_ = new §1t7528s0§();
                           canvas.addChild(_loc11_);
                           _loc11_.x = param1[_loc8_].x - param2;
                           _loc11_.y = param1[_loc8_].y;
                           _loc15_ = _loc8_;
                           _loc16_ = _loc8_ - 1;
                           if(_loc16_ < 0)
                           {
                              _loc16_ = _loc8_ + 1;
                           }
                           _loc11_.rotation = Math.atan2(param1[_loc16_].y - param1[_loc15_].y,param1[_loc16_].x - param1[_loc15_].x) * 57.2727;
                        }
                     }
                  }
                  _loc8_++;
               }
               if(_loc9_.§1t3256s0§)
               {
                  _loc10_++;
               }
               _loc9_.§1t3256s0§ = false;
            }
            _loc7_--;
         }
         _loc6_ = §1t10186s0§.length;
         _loc7_ = _loc6_ - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = §1t10186s0§[_loc7_];
            if(!_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
            {
               _loc8_ = 0;
               while(_loc8_ < _loc5_ && !_loc9_.§1t3256s0§)
               {
                  _loc12_ = _loc9_.mcs.x - param1[_loc8_].x + param2;
                  _loc13_ = (param1[_loc8_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§;
                  _loc14_ = param1[_loc8_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
                  if(_loc12_ * _loc12_ < 40000 && _loc9_.mcs.hitTestPoint(_loc13_,_loc14_,false))
                  {
                     _loc9_.§1t3273s0§(_loc13_,_loc14_,param3);
                  }
                  _loc8_++;
               }
               if(_loc9_.§1t3256s0§)
               {
                  _loc10_++;
               }
               _loc9_.§1t3256s0§ = false;
            }
            _loc7_--;
         }
         if(_loc10_ > 0)
         {
            §1t1523s0§.§1t9723s0§(_loc10_);
         }
         if(param4)
         {
            if(§1t10235s0§())
            {
               §1t1525s0§.§1t2292s0§();
            }
            else
            {
               §1t3278s0§();
            }
         }
      }
      
      public static function §1t10229s0§(param1:Vector.<Point>, param2:int, param3:§1t67s0§, param4:Boolean = true) : *
      {
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:int = 0;
         var _loc9_:§1t68s0§ = null;
         var _loc10_:§1t7528s0§ = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc5_:int = int(param1.length);
         _loc7_ = _loc6_ = §1t5730s0§.length;
         while(_loc7_ >= 0)
         {
            if(_loc7_ != _loc6_)
            {
               _loc9_ = §1t5730s0§[_loc7_];
            }
            else
            {
               _loc9_ = §1t1523s0§.§1t9586s0§();
            }
            if(_loc9_ != null && !_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
            {
               _loc8_ = 0;
               while(_loc8_ < _loc5_ && !_loc9_.§1t3256s0§)
               {
                  _loc11_ = _loc9_.mcs.x - param1[_loc8_].x + param2;
                  _loc12_ = (param1[_loc8_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§;
                  _loc13_ = param1[_loc8_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
                  if(_loc11_ * _loc11_ < 40000 && _loc9_.mcs.hitTestPoint(_loc12_,_loc13_,false))
                  {
                     if(_loc9_.§1t3273s0§(_loc12_,_loc13_,param3))
                     {
                        if(!§1t1525s0§.§1t9952s0§())
                        {
                           _loc10_ = new §1t7528s0§();
                           canvas.addChild(_loc10_);
                           _loc10_.x = param1[_loc8_].x - param2;
                           _loc10_.y = param1[_loc8_].y;
                           _loc14_ = _loc8_;
                           _loc15_ = _loc8_ - 1;
                           if(_loc15_ < 0)
                           {
                              _loc15_ = _loc8_ + 1;
                           }
                           _loc10_.rotation = Math.atan2(param1[_loc15_].y - param1[_loc14_].y,param1[_loc15_].x - param1[_loc14_].x) * 57.2727;
                        }
                     }
                  }
                  _loc8_++;
               }
               _loc9_.§1t3256s0§ = false;
            }
            _loc7_--;
         }
      }
      
      public static function §1t10230s0§(param1:Vector.<Point>, param2:int, param3:§1t67s0§, param4:Boolean = true) : *
      {
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:int = 0;
         var _loc9_:§1t68s0§ = null;
         var _loc10_:§1t7528s0§ = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc5_:int = int(param1.length);
         _loc9_ = §1t1523s0§.§1t9586s0§();
         if(_loc9_ != null && !_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
         {
            _loc8_ = 0;
            while(_loc8_ < _loc5_ && !_loc9_.§1t3256s0§)
            {
               _loc11_ = _loc9_.mcs.x - param1[_loc8_].x + param2;
               _loc12_ = (param1[_loc8_].x - param2) * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9359s0§;
               _loc13_ = param1[_loc8_].y * §1t1523s0§.§1t9358s0§ + §1t1523s0§.§1t9360s0§;
               if(_loc11_ * _loc11_ < 40000 && _loc9_.mcs.hitTestPoint(_loc12_,_loc13_,false))
               {
                  if(_loc9_.§1t3273s0§(_loc12_,_loc13_,param3))
                  {
                     if(!§1t1525s0§.§1t9952s0§())
                     {
                        _loc10_ = new §1t7528s0§();
                        canvas.addChild(_loc10_);
                        _loc10_.x = param1[_loc8_].x - param2;
                        _loc10_.y = param1[_loc8_].y;
                        _loc14_ = _loc8_;
                        _loc15_ = _loc8_ - 1;
                        if(_loc15_ < 0)
                        {
                           _loc15_ = _loc8_ + 1;
                        }
                        _loc10_.rotation = Math.atan2(param1[_loc15_].y - param1[_loc14_].y,param1[_loc15_].x - param1[_loc14_].x) * 57.2727;
                     }
                  }
               }
               _loc8_++;
            }
            _loc9_.§1t3256s0§ = false;
         }
      }
      
      public static function §1t10231s0§(param1:int, param2:Boolean = false) : §1t68s0§
      {
         var _loc3_:§1t68s0§ = null;
         var _loc7_:Array = null;
         var _loc9_:int = 0;
         var _loc4_:int = 99999;
         var _loc5_:int = 0;
         var _loc6_:§1t68s0§ = null;
         if(!param2)
         {
            _loc7_ = §1t10185s0§;
         }
         else
         {
            _loc7_ = §1t5730s0§;
         }
         var _loc8_:int = int(_loc7_.length);
         var _loc10_:int = §1t1525s0§.§1t8124s0§();
         var _loc11_:* = int(_loc8_ - 1);
         while(_loc11_ >= 0)
         {
            _loc3_ = _loc7_[_loc11_] as §1t68s0§;
            _loc9_ = _loc3_.§1t1555s0§();
            if(_loc9_ > 0 && _loc9_ < _loc10_)
            {
               _loc5_ = Math.abs(param1 - _loc9_);
               if(!_loc3_.§1t2364s0§() && _loc5_ < _loc4_ && _loc3_.actionState != §1t1544s0§.§1t11197s0§)
               {
                  if(param2 && §1t1540s0§.§1t10048s0§() && _loc3_.§1t3314s0§())
                  {
                     break;
                  }
                  _loc6_ = _loc3_;
                  _loc4_ = _loc5_;
               }
            }
            _loc11_--;
         }
         if(param2)
         {
            _loc3_ = §1t1523s0§.§1t9586s0§() as §1t68s0§;
            _loc5_ = Math.abs(param1 - _loc3_.§1t1555s0§());
            if(!_loc3_.§1t2364s0§() && _loc5_ < _loc4_)
            {
               _loc6_ = _loc3_;
               _loc4_ = _loc5_;
            }
         }
         return _loc6_;
      }
      
      public static function §1t3275s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:§1t68s0§ = null;
         _loc3_ = int(§1t10185s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10185s0§[_loc4_];
            if(!_loc5_.§1t2364s0§() && _loc5_.§1t3272s0§() && _loc5_.§1t3274s0§(param1,param2,true))
            {
               return true;
            }
            _loc4_--;
         }
         return false;
      }
      
      public static function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:int = 100, param4:Boolean = false, param5:MovieClip = null, param6:Boolean = false) : Boolean
      {
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:§1t68s0§ = null;
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:int = param3 * param3;
         _loc7_ = int(§1t10185s0§.length);
         _loc8_ = int(_loc7_ - 1);
         while(_loc8_ >= 0)
         {
            _loc9_ = §1t10185s0§[_loc8_];
            if(_loc9_ != null && !_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
            {
               if(param5 != null)
               {
                  _loc11_ = _loc9_.§1t1559s0§().x - param5.x;
               }
               else
               {
                  _loc11_ = _loc9_.§1t1559s0§().x - param1.x;
               }
               if(_loc11_ * _loc11_ < _loc12_ && _loc9_.§1t3274s0§(param1,param2,param4,param6))
               {
                  _loc10_++;
               }
            }
            _loc8_--;
         }
         _loc7_ = int(§1t10186s0§.length);
         _loc8_ = int(_loc7_ - 1);
         while(_loc8_ >= 0)
         {
            _loc9_ = §1t10186s0§[_loc8_];
            if(_loc9_ != null && !_loc9_.§1t2364s0§() && _loc9_.§1t3272s0§())
            {
               if(param5 != null)
               {
                  _loc11_ = _loc9_.§1t1559s0§().x - param5.x;
               }
               else
               {
                  _loc11_ = _loc9_.§1t1559s0§().x - param1.x;
               }
               if(_loc11_ * _loc11_ < _loc12_ && _loc9_.§1t3274s0§(param1,param2,param4,param6))
               {
                  _loc10_++;
               }
            }
            _loc8_--;
         }
         if(_loc10_ > 0)
         {
            §1t1523s0§.§1t9723s0§(_loc10_);
         }
         if(§1t10235s0§())
         {
            §1t1525s0§.§1t2292s0§();
         }
         else
         {
            §1t3278s0§();
         }
         return _loc10_ > 0;
      }
      
      public static function §1t10232s0§(param1:MovieClip, param2:§1t67s0§, param3:int = 100, param4:Boolean = false, param5:MovieClip = null, param6:§1t68s0§ = null, param7:Boolean = false) : Boolean
      {
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:§1t68s0§ = null;
         var _loc12_:int = 0;
         var _loc11_:Boolean = false;
         var _loc13_:int = param3 * param3;
         _loc10_ = §1t1523s0§.§1t9586s0§();
         if(!_loc10_.§1t2364s0§() && _loc10_.§1t3272s0§())
         {
            if(param5 != null)
            {
               _loc12_ = _loc10_.§1t1559s0§().x - param5.x;
            }
            else
            {
               _loc12_ = _loc10_.§1t1559s0§().x - param1.x;
            }
            if(_loc12_ * _loc12_ < _loc13_ && _loc10_.§1t3274s0§(param1,param2,param4,param7))
            {
               _loc11_ = true;
            }
         }
         _loc8_ = int(§1t5730s0§.length);
         _loc9_ = int(_loc8_ - 1);
         while(_loc9_ >= 0)
         {
            _loc10_ = §1t5730s0§[_loc9_];
            if(_loc10_ != null && _loc10_ != param6 && !_loc10_.§1t2364s0§() && _loc10_.§1t3272s0§())
            {
               if(param5 != null)
               {
                  _loc12_ = _loc10_.§1t1559s0§().x - param5.x;
               }
               else
               {
                  _loc12_ = _loc10_.§1t1559s0§().x - param1.x;
               }
               if(_loc12_ * _loc12_ < _loc13_ && _loc10_.§1t3274s0§(param1,param2,param4,param7))
               {
                  _loc10_.§1t3278s0§();
                  _loc11_ = true;
               }
            }
            _loc9_--;
         }
         _loc8_ = int(§1t10186s0§.length);
         _loc9_ = int(_loc8_ - 1);
         while(_loc9_ >= 0)
         {
            _loc10_ = §1t10186s0§[_loc9_];
            if(_loc10_ != null && _loc10_ != param6 && !_loc10_.§1t2364s0§() && _loc10_.§1t3272s0§())
            {
               if(param5 != null)
               {
                  _loc12_ = _loc10_.§1t1559s0§().x - param5.x;
               }
               else
               {
                  _loc12_ = _loc10_.§1t1559s0§().x - param1.x;
               }
               if(_loc12_ * _loc12_ < _loc13_ && _loc10_.§1t3274s0§(param1,param2,param4,param7))
               {
                  _loc10_.§1t3278s0§();
                  _loc11_ = true;
               }
            }
            _loc9_--;
         }
         return _loc11_;
      }
      
      public static function §1t10233s0§(param1:MovieClip, param2:Boolean = false) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:§1t68s0§ = null;
         var _loc6_:Array = new Array();
         _loc3_ = int(§1t10185s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10185s0§[_loc4_];
            if(!_loc5_.§1t2364s0§() && _loc5_.§1t3272s0§() && _loc5_.§1t3276s0§(param1))
            {
               _loc6_.push(_loc5_);
               if(param2)
               {
                  break;
               }
            }
            _loc4_--;
         }
         if(!(param2 && _loc6_.length > 0))
         {
            _loc3_ = int(§1t10186s0§.length);
            _loc4_ = int(_loc3_ - 1);
            while(_loc4_ >= 0)
            {
               _loc5_ = §1t10186s0§[_loc4_];
               if(!_loc5_.§1t2364s0§() && _loc5_.§1t3272s0§() && _loc5_.§1t3276s0§(param1))
               {
                  _loc6_.push(_loc5_);
                  if(param2)
                  {
                     break;
                  }
               }
               _loc4_--;
            }
         }
         return _loc6_;
      }
      
      public static function §1t10234s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:§1t68s0§ = null;
         var _loc6_:int = 0;
         _loc3_ = int(§1t10185s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10185s0§[_loc4_];
            if(!_loc5_.§1t2364s0§() && _loc5_.§1t3292s0§() && _loc5_.§1t3274s0§(param1,param2,true))
            {
               _loc6_++;
            }
            _loc4_--;
         }
         _loc3_ = int(§1t10186s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10186s0§[_loc4_];
            if(!_loc5_.§1t2364s0§() && _loc5_.§1t3292s0§() && _loc5_.§1t3274s0§(param1,param2,true))
            {
               _loc6_++;
            }
            _loc4_--;
         }
         if(_loc6_ > 0)
         {
            §1t1523s0§.§1t9723s0§(_loc6_);
         }
         §1t3278s0§();
         --§1t10177s0§;
         if(§1t10235s0§())
         {
            §1t1525s0§.§1t2292s0§();
         }
         ++§1t10177s0§;
         return _loc6_ > 0;
      }
      
      public static function §1t10235s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:§1t68s0§ = null;
         var _loc3_:* = 0;
         if(§1t10177s0§ == §1t10190s0§.length - 1 && (!endless || §1t1525s0§.§1t9939s0§()) && !§1t1540s0§.§1t10047s0§())
         {
            _loc1_ = int(§1t10185s0§.length);
            _loc3_ = int(_loc1_ - 1);
            while(_loc3_ >= 0)
            {
               _loc2_ = §1t10185s0§[_loc3_];
               if(!_loc2_.§1t2364s0§() && !_loc2_.§1t3279s0§())
               {
                  return false;
               }
               _loc3_--;
            }
            return true;
         }
         return false;
      }
      
      public static function §1t10236s0§() : *
      {
         if(§1t10235s0§())
         {
            §1t1525s0§.§1t2292s0§();
         }
         else
         {
            §1t3278s0§();
         }
      }
      
      public static function §1t10237s0§() : *
      {
         §1t3278s0§();
         --§1t10177s0§;
         if(§1t10235s0§())
         {
            §1t1525s0§.§1t2292s0§();
         }
         ++§1t10177s0§;
      }
      
      public static function §1t3278s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:§1t68s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc1_ = int(§1t10185s0§.length);
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = §1t10185s0§[_loc2_];
            if(!_loc3_.§1t2364s0§() && _loc3_.§1t3278s0§())
            {
               if(_loc3_.§1t1071s0§)
               {
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc2_--;
         }
         _loc1_ = int(§1t10186s0§.length);
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = §1t10186s0§[_loc2_];
            if(!_loc3_.§1t2364s0§() && _loc3_.§1t3278s0§())
            {
               if(_loc3_.§1t1071s0§)
               {
                  _loc5_++;
               }
               _loc4_++;
            }
            _loc2_--;
         }
         §1t10200s0§();
         §1t10201s0§();
         if(_loc4_ > 0)
         {
            §1t1523s0§.§1t9586s0§().§1t4479s0§();
         }
         §1t10181s0§ += _loc4_;
         §1t10182s0§ += _loc5_;
      }
      
      public static function §1t2292s0§() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         cleanUp();
         _loc1_ = §1t10185s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10185s0§[_loc2_].§1t2292s0§();
            _loc2_--;
         }
         _loc1_ = §1t5730s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t5730s0§[_loc2_].§1t2292s0§();
            _loc2_--;
         }
         _loc1_ = §1t10186s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10186s0§[_loc2_].§1t2292s0§();
            _loc2_--;
         }
      }
      
      public static function §1t3310s0§() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         _loc1_ = §1t10185s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10185s0§[_loc2_].§1t3310s0§();
            _loc2_--;
         }
         _loc1_ = §1t5730s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t5730s0§[_loc2_].§1t3310s0§();
            _loc2_--;
         }
         _loc1_ = §1t10186s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10186s0§[_loc2_].§1t3310s0§();
            _loc2_--;
         }
         §1t3278s0§();
      }
      
      public static function §1t3311s0§() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         _loc1_ = §1t10185s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10185s0§[_loc2_].§1t3311s0§();
            _loc2_--;
         }
         _loc1_ = §1t5730s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t5730s0§[_loc2_].§1t3311s0§();
            _loc2_--;
         }
         _loc1_ = §1t10186s0§.length;
         _loc2_ = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10186s0§[_loc2_].§1t3311s0§();
            _loc2_--;
         }
      }
      
      public static function cleanUp() : *
      {
         var _loc1_:§1t1544s0§ = null;
         var _loc2_:* = 0;
         var _loc3_:* = §1t10185s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = §1t10185s0§[_loc2_];
            if(_loc1_.mcs == null)
            {
               §1t10185s0§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         _loc3_ = §1t10186s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = §1t10186s0§[_loc2_];
            if(_loc1_.mcs == null)
            {
               §1t10186s0§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         _loc3_ = §1t5730s0§.length;
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = §1t5730s0§[_loc2_];
            if(_loc1_.mcs == null)
            {
               §1t5730s0§.splice(_loc2_,1);
            }
            _loc2_--;
         }
      }
      
      public static function §1t10239s0§() : int
      {
         return §1t10181s0§;
      }
      
      public static function §1t10240s0§() : int
      {
         return §1t10182s0§;
      }
      
      public static function §1t10241s0§(param1:int, param2:int) : §1t68s0§
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:§1t68s0§ = null;
         _loc3_ = int(§1t10185s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10185s0§[_loc4_];
            if(!_loc5_.§1t2364s0§())
            {
               if(_loc5_.mcs.hitTestPoint(param1,param2))
               {
                  return _loc5_;
               }
            }
            _loc4_--;
         }
         _loc3_ = int(§1t10186s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t10186s0§[_loc4_];
            if(!_loc5_.§1t2364s0§())
            {
               if(_loc5_.mcs.hitTestPoint(param1,param2))
               {
                  return _loc5_;
               }
            }
            _loc4_--;
         }
         _loc3_ = int(§1t5730s0§.length);
         _loc4_ = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = §1t5730s0§[_loc4_];
            if(!_loc5_.§1t2364s0§())
            {
               if(_loc5_.mcs.hitTestPoint(param1,param2))
               {
                  return _loc5_;
               }
            }
            _loc4_--;
         }
         return null;
      }
      
      public static function §1t10242s0§(param1:Boolean) : *
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:§1t68s0§ = null;
         _loc2_ = int(§1t10185s0§.length);
         _loc3_ = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = §1t10185s0§[_loc3_];
            _loc4_.§1t1552s0§(canvas);
            _loc4_.§1t3305s0§();
            _loc3_--;
         }
         _loc2_ = int(§1t5730s0§.length);
         _loc3_ = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = §1t5730s0§[_loc3_];
            _loc4_.§1t1552s0§(canvas);
            _loc4_.§1t3305s0§();
            _loc3_--;
         }
         _loc2_ = int(§1t10186s0§.length);
         _loc3_ = int(_loc2_ - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = §1t10186s0§[_loc3_];
            if(param1 || _loc4_.§1t3306s0§() == "")
            {
               _loc4_.§1t1552s0§(canvas);
               _loc4_.§1t3305s0§();
            }
            _loc3_--;
         }
         if(param1)
         {
            reset();
         }
         else
         {
            §1t10188s0§.fixed = false;
            §1t10189s0§.fixed = false;
            §1t10195s0§.fixed = false;
            §1t10185s0§.length = 0;
            §1t5730s0§.length = 0;
            §1t10186s0§.length = 0;
            §1t10188s0§.length = 0;
            §1t10195s0§.length = 0;
            §1t10187s0§.length = 0;
            §1t10193s0§.fixed = false;
            §1t10190s0§.fixed = false;
            §1t10191s0§.fixed = false;
            §1t10192s0§.fixed = false;
            §1t10193s0§.fixed = false;
            §1t10190s0§.length = 0;
            §1t10191s0§.length = 0;
            §1t10192s0§.length = 0;
            §1t10193s0§.length = 0;
            §1t10177s0§ = -1;
            §1t10178s0§ = -1;
            endless = false;
            _loc2_ = int(§1t10189s0§.length);
            _loc3_ = int(_loc2_ - 1);
            while(_loc3_ >= 0)
            {
               §1t10186s0§.push(§1t10189s0§[_loc3_]);
               _loc3_--;
            }
         }
      }
      
      public static function §1t10243s0§(param1:String) : *
      {
         var _loc4_:§1t122s0§ = null;
         var _loc5_:int = 0;
         if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9234s0§ || §1t251s0§.instance.§1t3612s0§() || §1t1540s0§.§1t10048s0§())
         {
            return;
         }
         param1 = param1.toLowerCase();
         var _loc2_:int = int(§1t10183s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t10183s0§[_loc3_] == param1)
            {
               return;
            }
            _loc3_++;
         }
         §1t10183s0§.push(param1);
         if(§1t1540s0§.§1t10047s0§())
         {
            _loc2_ = int(§1t10189s0§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = §1t10189s0§[_loc3_] as §1t122s0§;
               if(_loc4_.charname.toLowerCase() == param1)
               {
                  _loc5_ = §1t10185s0§.indexOf(_loc4_);
                  if(_loc5_ != -1)
                  {
                     §1t10185s0§.splice(_loc5_,1);
                     §1t5730s0§.push(_loc4_);
                     §1t251s0§.instance.§1t3535s0§(_loc4_.charname,true);
                  }
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      public static function §1t10244s0§() : *
      {
         var _loc2_:§1t122s0§ = null;
         var _loc1_:int = int(§1t10189s0§.length);
         var _loc3_:* = int(_loc1_ - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = §1t10189s0§[_loc3_] as §1t122s0§;
            if(!_loc2_.§1t4897s0§())
            {
               §1t10243s0§(_loc2_.charname);
            }
            _loc3_--;
         }
      }
      
      public static function §1t10245s0§(param1:String) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§1t122s0§ = null;
         var _loc5_:int = 0;
         if(§1t1525s0§.§1t9923s0§() == §1t134s0§.§1t9234s0§ || §1t251s0§.instance.§1t3612s0§() || §1t1540s0§.§1t10048s0§())
         {
            return;
         }
         param1 = param1.toLowerCase();
         _loc2_ = §1t10183s0§.indexOf(param1);
         if(_loc2_ != -1)
         {
            §1t10183s0§.splice(_loc2_,1);
         }
         if(§1t1540s0§.§1t10047s0§())
         {
            _loc3_ = int(§1t10189s0§.length);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = §1t10189s0§[_loc5_] as §1t122s0§;
               if(_loc4_.spectator != 0)
               {
                  return;
               }
               if(_loc4_.charname.toLowerCase() == param1)
               {
                  _loc2_ = §1t5730s0§.indexOf(_loc4_);
                  if(_loc2_ != -1)
                  {
                     §1t5730s0§.splice(_loc2_,1);
                     §1t10185s0§.push(_loc4_);
                     §1t251s0§.instance.§1t3535s0§(_loc4_.charname,false);
                  }
                  return;
               }
               _loc5_++;
            }
         }
      }
      
      public static function §1t10246s0§() : *
      {
         var _loc1_:int = int(§1t10183s0§.length);
         var _loc2_:* = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            §1t10245s0§(§1t10183s0§[_loc2_]);
            _loc2_--;
         }
      }
      
      public static function §1t10247s0§() : String
      {
         var _loc3_:String = null;
         var _loc1_:String = "Allies: ";
         var _loc2_:int = int(§1t10183s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t10183s0§[_loc4_];
            _loc1_ += _loc3_.substr(0,1).toUpperCase() + _loc3_.substr(1,_loc3_.length);
            if(_loc4_ != _loc2_ - 1)
            {
               _loc1_ += ", ";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public static function §1t10248s0§(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         var _loc2_:int = int(§1t10183s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t10183s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function §1t10249s0§(param1:String) : *
      {
         param1 = param1.toLowerCase();
         var _loc2_:int = int(§1t10184s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t10184s0§[_loc3_] == param1)
            {
               return;
            }
            _loc3_++;
         }
         §1t10184s0§.push(param1);
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9693s0§);
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      public static function §1t10250s0§(param1:String) : *
      {
         param1 = param1.toLowerCase();
         var _loc2_:int = §1t10184s0§.indexOf(param1);
         if(_loc2_ != -1)
         {
            §1t10184s0§.splice(_loc2_,1);
         }
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9693s0§);
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      public static function §1t10251s0§(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         var _loc2_:int = int(§1t10184s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t10184s0§[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function §1t10252s0§() : String
      {
         var _loc3_:String = null;
         var _loc1_:String = "Ignoring: ";
         var _loc2_:int = int(§1t10184s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = §1t10184s0§[_loc4_];
            _loc1_ += _loc3_.substr(0,1).toUpperCase() + _loc3_.substr(1,_loc3_.length);
            if(_loc4_ != _loc2_ - 1)
            {
               _loc1_ += ", ";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public static function §1t10253s0§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(§1t10184s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ += §1t10184s0§[_loc3_];
            if(_loc3_ != _loc2_ - 1)
            {
               _loc1_ += "|";
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public static function §1t10254s0§(param1:String) : *
      {
         if(param1 == null || param1 == "" || param1 == "-")
         {
            §1t10184s0§.length = 0;
         }
         else
         {
            §1t10184s0§ = param1.split("|");
         }
      }
      
      public static function §1t10256s0§(param1:§1t122s0§) : *
      {
         if(§1t1523s0§.§1t9380s0§ < 10 && param1.§1t1559s0§() != null)
         {
            §1t1523s0§.§1t9380s0§ = 10;
            if(param1.charname != §1t10255s0§)
            {
               §1t1524s0§.§1t9879s0§(param1.§1t1559s0§().§1t1251s0§(),param1.charname);
               §1t10255s0§ = param1.charname;
            }
         }
      }
      
      public static function §1t10257s0§() : *
      {
         var _loc2_:§1t122s0§ = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(§1t10189s0§.length);
         if(_loc1_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = §1t10189s0§[_loc3_] as §1t122s0§;
               if(_loc2_.§1t3314s0§())
               {
                  §1t10256s0§(_loc2_);
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      internal static function §1t10258s0§() : Boolean
      {
         return §1t1523s0§.§1t9380s0§ > 0;
      }
   }
}

