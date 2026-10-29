package
{
   public class §1t120s0§
   {
      
      public static var instance:§1t120s0§;
      
      public static var §1t10123s0§:int = 1000;
      
      public static var §1t10124s0§:int = 1001;
      
      public static var §1t10125s0§:int = 1002;
      
      public static var §1t10126s0§:int = 1003;
      
      public static var §1t10127s0§:int = 1004;
      
      public static var §1t10128s0§:int = 1005;
      
      public static var §1t10129s0§:int = 1006;
      
      public static var §1t10130s0§:int = 1007;
      
      public static var §1t10131s0§:int = 1010;
      
      public static var §1t10132s0§:int = 1012;
      
      public static var §1t10133s0§:int = 1013;
      
      public static var §1t10134s0§:int = 1024;
      
      public static var §1t10135s0§:int = 1025;
      
      public static var §1t10136s0§:int = 1026;
      
      public static var §1t10137s0§:int = 1027;
      
      public static var §1t10138s0§:int = 1028;
      
      public static var §1t10139s0§:int = 1029;
      
      public static var §1t10140s0§:int = 1030;
      
      public static var §1t10141s0§:int = 1031;
      
      public static var §1t10142s0§:int = 1032;
      
      public static var §1t10143s0§:int = 1033;
      
      public static var §1t10144s0§:int = 1034;
      
      public static var §1t10145s0§:int = 1035;
      
      public static var §1t10146s0§:int = 1039;
      
      public static var §1t10147s0§:int = 1040;
      
      public static var §1t10148s0§:int = 1041;
      
      public static var §1t10149s0§:int = 1042;
      
      public static var §1t10150s0§:int = 1043;
      
      public static var §1t10151s0§:int = 1044;
      
      public static var §1t10152s0§:int = 1045;
      
      public static var §1t10153s0§:int = 1046;
      
      public static var §1t10154s0§:int = 1047;
      
      public static var §1t10155s0§:int = 1048;
      
      public static var §1t10156s0§:int = 1049;
      
      public static var §1t10157s0§:int = 1050;
      
      public static var §1t10158s0§:int = 1051;
      
      public static var §1t10159s0§:int = 1052;
      
      public static var §1t10160s0§:int = 1053;
      
      public static var §1t10161s0§:int = 1054;
      
      public static var §1t10162s0§:int = 1055;
      
      public static var §1t10163s0§:int = 1064;
      
      public static var §1t10164s0§:int = 1065;
      
      public static var §1t10165s0§:int = 1066;
      
      public static var §1t10166s0§:int = 1067;
      
      public static var §1t10167s0§:int = 1068;
      
      public static var §1t10168s0§:int = 1069;
      
      public static var §1t10169s0§:int = 1070;
      
      public static var §1t10170s0§:int = 1071;
      
      public static var §1t10171s0§:int = 1072;
      
      public static var §1t10172s0§:int = 1073;
      
      public static var §1t10173s0§:int = 1074;
      
      public static var §1t10174s0§:int = 1075;
      
      public static var §1t10175s0§:int = 1076;
      
      public static var §1t10176s0§:int = 1077;
      
      public function §1t120s0§()
      {
         super();
         instance = this;
      }
      
      public static function §1t9190s0§() : §1t120s0§
      {
         if(instance == null)
         {
            instance = new §1t120s0§();
         }
         return instance;
      }
      
      internal function §1t1542s0§(param1:int, param2:int, param3:§1t99s0§, param4:§1t68s0§ = null, param5:§1t105s0§ = null, param6:int = -1, param7:int = -1) : Boolean
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:§1t8384s0§ = null;
         var _loc15_:int = 0;
         if(§1t1525s0§.§1t9947s0§() || param3.§1t3258s0§)
         {
            return false;
         }
         if(param3.controlledBy == 0 && (§1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12137s0§ || §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12138s0§))
         {
            return false;
         }
         if(!(param1 == §1t10131s0§ && param2 > 1) && !param3.§1t4469s0§() && !(param3.§1t4456s0§() && (param1 == §1t10153s0§ || param1 == §1t10146s0§ || param1 == §1t10147s0§ || param1 == §1t10148s0§)))
         {
            return false;
         }
         if(param1 == §1t10131s0§ && param2 > 1 && !param3.§1t4471s0§())
         {
            return false;
         }
         if(param5 == null)
         {
            param5 = §1t1524s0§.§1t9863s0§(param1);
         }
         if(param1 == §1t10153s0§ && !(param6 == 0 && param7 == 0) && param3.§1t4492s0§() == 0)
         {
            return false;
         }
         if((param1 == §1t10160s0§ || param1 == §1t10162s0§) && (§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§()))
         {
            return false;
         }
         if(param3.§1t3312s0§() && !param3.§1t4490s0§(param5.§1t1463s0§(param2)))
         {
            return false;
         }
         param3.§1t4494s0§();
         switch(param1)
         {
            case §1t10126s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11144s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11144s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10127s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11161s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11161s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10156s0§:
               _loc12_ = §1t1544s0§.§1t11171s0§;
               if(param6 == -1)
               {
                  param6 = param3.§1t1555s0§() + 1;
               }
               else
               {
                  param6 += §1t1525s0§.§1t8131s0§();
               }
               if(param6 < param3.§1t1555s0§() && param3.§1t1559s0§().§1t6283s0§() || param6 > param3.§1t1555s0§() && !param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc12_ = §1t1544s0§.§1t11175s0§;
               }
               param3.§1t3269s0§(_loc12_);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(_loc12_,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10157s0§:
               _loc13_ = §1t1544s0§.§1t11171s0§;
               if(param6 == -1)
               {
                  param6 = param3.§1t1555s0§() - 1;
               }
               else
               {
                  param6 += §1t1525s0§.§1t8131s0§();
               }
               if(param6 < param3.§1t1555s0§() && param3.§1t1559s0§().§1t6283s0§() || param6 > param3.§1t1555s0§() && !param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc13_ = §1t1544s0§.§1t11175s0§;
               }
               param3.§1t3269s0§(_loc13_);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(_loc13_,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10128s0§:
               param3.§1t4414s0§ = param3.§1t4415s0§ - 1;
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10925s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10925s0§);
               }
               break;
            case §1t10129s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10447s0§);
               if(param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc9_ = param3.§1t1555s0§() + 20;
                  _loc8_ = 10;
               }
               else
               {
                  _loc9_ = param3.§1t1555s0§() - 20;
                  _loc8_ = -10;
               }
               §1t1712s0§.§1t4568s0§(2,_loc9_,param3.§1t1559s0§().y,_loc8_,0,param3.§1t4424s0§,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10447s0§);
                  §1t251s0§.instance.§1t3495s0§(2,_loc9_,param3.§1t1559s0§().y,_loc8_,0,param3.§1t4424s0§,param2);
               }
               break;
            case §1t10130s0§:
            case §1t10139s0§:
            case §1t10140s0§:
            case §1t10141s0§:
            case §1t10142s0§:
               if(param3.§1t3312s0§())
               {
                  if(§1t1523s0§.§1t9714s0§(2501) == 0)
                  {
                     return false;
                  }
                  §1t1523s0§.§1t9713s0§(2501,-1);
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10345s0§);
               if(param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc9_ = param3.§1t1555s0§() + 20;
                  _loc8_ = 20;
               }
               else
               {
                  _loc9_ = param3.§1t1555s0§() - 20;
                  _loc8_ = -20;
               }
               if(param1 == §1t10130s0§)
               {
                  _loc10_ = param3.§1t4424s0§;
                  _loc11_ = §1t1712s0§.§1t11272s0§;
               }
               else if(param1 == §1t10139s0§)
               {
                  _loc10_ = param3.§1t1235s0§;
                  _loc11_ = §1t1712s0§.§1t11285s0§;
               }
               else if(param1 == §1t10140s0§)
               {
                  _loc10_ = param3.§1t1237s0§;
                  _loc11_ = §1t1712s0§.§1t11286s0§;
               }
               else if(param1 == §1t10141s0§)
               {
                  _loc10_ = param3.§1t1236s0§;
                  _loc11_ = §1t1712s0§.§1t11287s0§;
               }
               else if(param1 == §1t10142s0§)
               {
                  _loc10_ = param3.§1t1238s0§;
                  _loc11_ = §1t1712s0§.§1t11288s0§;
               }
               §1t1712s0§.§1t4568s0§(_loc11_,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,_loc10_,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10345s0§);
                  §1t251s0§.instance.§1t3495s0§(_loc11_,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,_loc10_,param2);
               }
               break;
            case §1t10158s0§:
               if(param3.§1t3312s0§())
               {
                  if(§1t1523s0§.§1t9714s0§(2501) < 4)
                  {
                     return false;
                  }
                  §1t1523s0§.§1t9713s0§(2501,-4);
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10345s0§);
               if(param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc9_ = param3.§1t1555s0§() + 20;
                  _loc8_ = 20;
               }
               else
               {
                  _loc9_ = param3.§1t1555s0§() - 20;
                  _loc8_ = -20;
               }
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10345s0§);
                  §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2);
               }
               break;
            case §1t10176s0§:
               if(param3.§1t3312s0§())
               {
                  if(§1t1523s0§.§1t9714s0§(2501) < 8)
                  {
                     return false;
                  }
                  §1t1523s0§.§1t9713s0§(2501,-8);
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               _loc9_ = param3.§1t1555s0§() + 20;
               _loc8_ = 20;
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10345s0§);
                  §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2);
               }
               _loc9_ = param3.§1t1555s0§() - 20;
               _loc8_ = -20;
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11304s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,0,param2);
               }
               break;
            case §1t10131s0§:
               if(param2 == 1)
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11160s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11160s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
                  }
               }
               else
               {
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11164s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
                  }
                  param3.§1t3269s0§(§1t1544s0§.§1t11164s0§);
               }
               break;
            case §1t10159s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11185s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11185s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10161s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11186s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11186s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10160s0§:
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11187s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),param3.§1t4436s0§.toString());
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11187s0§);
               break;
            case §1t10162s0§:
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11188s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),param3.§1t4436s0§.toString());
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11188s0§);
               break;
            case §1t10132s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11189s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11189s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10133s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11199s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10831s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11199s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10831s0§);
               }
               break;
            case §1t10143s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11177s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10851s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11177s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10851s0§);
               }
               break;
            case §1t10144s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11166s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10839s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11166s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10839s0§);
               }
               break;
            case §1t10145s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11200s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10835s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11200s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10835s0§);
               }
               break;
            case §1t10169s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11201s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10831s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11201s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10831s0§);
               }
               break;
            case §1t10172s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11204s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10823s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11204s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10823s0§);
               }
               break;
            case §1t10171s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11203s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10823s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11203s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10823s0§);
               }
               break;
            case §1t10170s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11202s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10823s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11202s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10823s0§);
               }
               break;
            case §1t10164s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10929s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10929s0§);
               }
               break;
            case §1t10168s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11198s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10941s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11198s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10941s0§);
               }
               break;
            case §1t10134s0§:
            case §1t10135s0§:
            case §1t10136s0§:
            case §1t10137s0§:
            case §1t10138s0§:
               if(param3.§1t3312s0§())
               {
                  if(§1t1523s0§.§1t9714s0§(2501) == 0)
                  {
                     return false;
                  }
                  §1t1523s0§.§1t9713s0§(2501,-1);
               }
               param3.§1t3269s0§(§1t1544s0§.§1t11165s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10329s0§);
               if(param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc9_ = param3.§1t1555s0§() + 50;
               }
               else
               {
                  _loc9_ = param3.§1t1555s0§() - 50;
               }
               if(param1 == §1t10134s0§)
               {
                  _loc10_ = param3.§1t4424s0§;
                  _loc11_ = §1t1712s0§.§1t11279s0§;
               }
               else if(param1 == §1t10135s0§)
               {
                  _loc10_ = param3.§1t1235s0§;
                  _loc11_ = §1t1712s0§.§1t11281s0§;
               }
               else if(param1 == §1t10136s0§)
               {
                  _loc10_ = param3.§1t1237s0§;
                  _loc11_ = §1t1712s0§.§1t11282s0§;
               }
               else if(param1 == §1t10137s0§)
               {
                  _loc10_ = param3.§1t1236s0§;
                  _loc11_ = §1t1712s0§.§1t11283s0§;
               }
               else if(param1 == §1t10138s0§)
               {
                  _loc10_ = param3.§1t1238s0§;
                  _loc11_ = §1t1712s0§.§1t11284s0§;
               }
               _loc14_ = §1t1712s0§.§1t4568s0§(_loc11_,_loc9_,param3.§1t1559s0§().y,0,0,_loc10_,param2,param3) as §1t8384s0§;
               if(!param3.§1t3312s0§())
               {
                  _loc14_.setNPCMode();
               }
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11165s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10329s0§);
               }
               break;
            case §1t10149s0§:
               param3.§1t1557s0§(§1t1544s0§.§1t10921s0§);
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10921s0§);
               }
               break;
            case §1t10150s0§:
               param3.§1t1557s0§(§1t1544s0§.§1t10891s0§);
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10891s0§);
               }
               break;
            case §1t10151s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11183s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t9121s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t9121s0§);
               }
               break;
            case §1t10163s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11194s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t9125s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t9125s0§);
               }
               break;
            case §1t10152s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11178s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10851s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11178s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10851s0§);
               }
               break;
            case §1t10146s0§:
               if(param6 == 0 && param7 == 0)
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11179s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10907s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11179s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10907s0§);
                  }
               }
               else
               {
                  param3.§1t1557s0§(§1t1544s0§.§1t10909s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10909s0§);
                  }
                  param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               }
               break;
            case §1t10147s0§:
               if(param6 == 0 && param7 == 0)
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11180s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10859s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11180s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10859s0§);
                  }
               }
               else
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10861s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10861s0§);
                  }
               }
               break;
            case §1t10148s0§:
               if(param6 == 0 && param7 == 0)
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11181s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10901s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11181s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10901s0§);
                  }
               }
               else
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10903s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10903s0§);
                  }
               }
               break;
            case §1t10153s0§:
               if(param6 == 0 && param7 == 0)
               {
                  param3.§1t3269s0§(§1t1544s0§.§1t11155s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10855s0§);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11155s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10855s0§);
                  }
               }
               else
               {
                  _loc15_ = param3.§1t4492s0§();
                  param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
                  param3.§1t1557s0§(§1t1544s0§.§1t10857s0§);
                  if(param3.§1t1559s0§().§1t6283s0§())
                  {
                     _loc9_ = param3.§1t1555s0§() + 25;
                     _loc8_ = 10;
                  }
                  else
                  {
                     _loc9_ = param3.§1t1555s0§() - 25;
                     _loc8_ = -10;
                  }
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11298s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,_loc15_,param2,param3);
                  if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
                  {
                     §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10857s0§);
                     §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11298s0§,_loc9_,param3.§1t1559s0§().y - 50,_loc8_,0,_loc15_,param2);
                  }
                  param3.§1t4493s0§();
               }
               break;
            case §1t10154s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11182s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10823s0§);
               if(param6 != -1)
               {
                  _loc9_ = param6 + §1t1525s0§.§1t8131s0§();
               }
               else if(param3.§1t1559s0§().§1t6283s0§())
               {
                  _loc9_ = param3.§1t1555s0§() + 40;
               }
               else
               {
                  _loc9_ = param3.§1t1555s0§() - 40;
               }
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11296s0§,_loc9_,§1t1525s0§.§1t4467s0§(),0,0,0,param2,param3);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11182s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10823s0§);
                  §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11296s0§,_loc9_,§1t1525s0§.§1t4467s0§(),0,0,0,param2);
               }
               break;
            case §1t10155s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11184s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10883s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11184s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10883s0§);
               }
               break;
            case §1t10165s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11195s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11195s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§());
               }
               break;
            case §1t10166s0§:
               param3.§1t3269s0§(§1t1544s0§.§1t11162s0§);
               param3.§1t1557s0§(§1t1544s0§.§1t10871s0§);
               if(§1t251s0§.instance.§1t3476s0§() && (param3.§1t3312s0§() || param3.§1t3315s0§()))
               {
                  §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11162s0§,param3.§1t1555s0§(),param3.§1t1559s0§().y,param3.§1t1559s0§().§1t6283s0§(),§1t1544s0§.§1t10871s0§);
               }
         }
         §1t113s0§.instance.§1t5198s0§();
         return true;
      }
   }
}

